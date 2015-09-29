require "easy_optimise/version"

module EasyOptimise
  def self.extended(base)
    base.class_eval do
      def self.has_optimised_attached_file(name, options={})
        full_options = Marshal.load(Marshal.dump(options))

        unoptimised_styles = full_options.delete(:unoptimised_styles)
        full_options[:styles].update(unoptimised_styles) if unoptimised_styles

        has_attached_file(name, full_options)

        optimised_styles = (options[:styles])? options[:styles].keys : []

        optimised_styles.each do |style|
          self.send("after_#{name}_post_process", Proc.new {
            attachment = self.send(name)
            path = attachment.queued_for_write[style].path
            width = attachment.styles[style].geometry.split('x').first.to_i
            Paperclip.run('convert', "-filter Triangle -define filter:support=2 -thumbnail #{width} -unsharp 0.25x0.25+8+0.065 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB -strip #{path} #{path}")
          })
        end
      end
    end
  end
end


