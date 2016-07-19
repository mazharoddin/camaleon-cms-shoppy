module Themes::Shoppy::MainHelper
  def self.included(klass)
    klass.helper_method [:shoppy_list_select] rescue "" # here your methods accessible from views
  end

  def shoppy_settings(theme)
    # here your code on save settings for current site, by default params[:theme_fields] is auto saved into theme
    # Also, you can save your extra values added in admin/settings.html.erb
    # sample: theme.set_meta("my_key", params[:my_value])
    theme.set_field_values(params[:field_options])
  end

  def shoppy_list_select
    res = []
    current_site.the_post_types.decorate.each {|p| res << "<option value='#{p.the_slug}'>#{p.the_title}</option>" }
    res.join("").html_safe
  end
  # callback called after theme installed
  def shoppy_on_install_theme(theme)
    # # Sample Custom Field
    # unless theme.get_field_groups.where(slug: "fields").any?
    #   group = theme.add_field_group({name: "Main Settings", slug: "fields", description: ""})
    #   group.add_field({"name"=>"Background color", "slug"=>"bg_color"},{field_key: "colorpicker"})
    #   group.add_field({"name"=>"Links color", "slug"=>"links_color"},{field_key: "colorpicker"})
    #   group.add_field({"name"=>"Background image", "slug"=>"bg"},{field_key: "image"})
    # end

    # # Sample Meta Value
    # theme.set_meta("installed_at", Time.current.to_s) # save a custom value
    group = theme.add_field_group({name: "Header", slug: "header_fields"})
    group.add_field({"name"=>"Phone Number", "slug"=>"phone_number"}, {field_key: "phone", default_value: "+2950188821"})
    group.add_field({"name"=>"Header Email", "slug"=>"header_email"}, {field_key: "email", default_value: "support@shoplid.com" })
    group.add_field({"name"=>"FB Page Link", "slug"=>"header_fb"}, {field_key: "text_box", default_value: "http://facebook.com/shoplid" })
    group.add_field({"name"=>"Twitter Link", "slug"=>"header_twitter"}, {field_key: "text_box", default_value: "https://twitter.com/shoplid" })
    group.add_field({"name"=>"Google Plus", "slug"=>"header_gplus"}, {field_key: "text_box", default_value: "https://plus.google.com/+Shoplid/" })

    group = theme.add_field_group({name: "Slider", slug: "slider_fields"})
    group.add_field({"name"=>"Slider 1 Image ", "slug"=>"slider_1_image"}, {field_key: "image", default_value: "http://d2ihefxq2o9hi4.cloudfront.net/assets/backyard/images/intro-image-bd354381d525c044cd7e997a1b5868f560aaf205c29a9424063b1112920b3070.jpg"})
    group.add_field({"name"=>"Slider 1 Header ", "slug"=>"slider_1_header"}, {field_key: "text_box", default_value: "<span>SHOPPY</span>"})
    group.add_field({"name"=>"Slider 1 Sub Header ", "slug"=>"slider_1_sub_header"}, {field_key: "text_box", default_value: "Free E-commerce Theme"})
    group.add_field({"name"=>"Slider 1 Description ", "slug"=>"slider_1_description"}, {field_key: "text_area", default_value: "Shoppy is a modern and customizable eCommerce theme designed to increase your online store sales. Shoppy is flexible enough to suit any kind of your business."})
    group.add_field({"name"=>"Slider 1 Link ", "slug"=>"slider_1_link"}, {field_key: "text_box", default_value: "http://shoplid.com"})
    
    group.add_field({"name"=>"Slider 2 Image ", "slug"=>"slider_2_image"}, {field_key: "image", default_value: "http://d2ihefxq2o9hi4.cloudfront.net/assets/backyard/images/intro-image-bd354381d525c044cd7e997a1b5868f560aaf205c29a9424063b1112920b3070.jpg"})
    group.add_field({"name"=>"Slider 2 Header ", "slug"=>"slider_2_header"}, {field_key: "text_box", default_value: "<span>SHOPPY</span>"})
    group.add_field({"name"=>"Slider 2 Sub Header ", "slug"=>"slider_2_sub_header"}, {field_key: "text_box", default_value: "Free E-commerce Theme"})
    group.add_field({"name"=>"Slider 2 Description ", "slug"=>"slider_2_description"}, {field_key: "text_area", default_value: "Shoppy is a modern and customizable eCommerce theme designed to increase your online store sales. Shoppy is flexible enough to suit any kind of your business."})
    group.add_field({"name"=>"Slider 2 Link ", "slug"=>"slider_2_link"}, {field_key: "text_box", default_value: "http://shoplid.com"})
    
    group.add_field({"name"=>"Slider 3 Image ", "slug"=>"slider_3_image"}, {field_key: "image", default_value: "http://d2ihefxq2o9hi4.cloudfront.net/assets/backyard/images/intro-image-bd354381d525c044cd7e997a1b5868f560aaf205c29a9424063b1112920b3070.jpg"})
    group.add_field({"name"=>"Slider 3 Header ", "slug"=>"slider_3_header"}, {field_key: "text_box", default_value: "<span>SHOPPY</span>"})
    group.add_field({"name"=>"Slider 3 Sub Header ", "slug"=>"slider_3_sub_header"}, {field_key: "text_box", default_value: "Free E-commerce Theme"})
    group.add_field({"name"=>"Slider 3 Description ", "slug"=>"slider_3_description"}, {field_key: "text_area", default_value: "Shoppy is a modern and customizable eCommerce theme designed to increase your online store sales. Shoppy is flexible enough to suit any kind of your business."})
    group.add_field({"name"=>"Slider 3 Link ", "slug"=>"slider_3_link"}, {field_key: "text_box", default_value: "http://shoplid.com"})
    
    group = theme.add_field_group({name: "Home Page", slug: "home_page"})
    group.add_field({"name"=>"Recent items from", "slug"=>"recent_post_type"}, {field_key: "select_eval", command: "shoppy_list_select"})
    group.add_field({"name"=>"Maximum of items", "slug"=>"home_qty"}, {field_key: "numeric", default_value: 6})

    group = theme.add_field_group({name: "Footer", slug: "footer"})
    group.add_field({"name"=>"Column Left", "slug"=>"footer_left"}, {field_key: "editor", translate: true, default_value: "<h4>My Bunker</h4><p>Some Address 987,<br> +34 9054 5455, <br> Madrid, Spain. </p>"})
    group.add_field({"name"=>"Column Center", "slug"=>"footer_center"}, {field_key: "editor", translate: true, default_value: "<h4>My Links</h4> <p><a href='#'>Dribbble</a><br> <a href='#'>Twitter</a><br> <a href='#'>Facebook</a></p>"})
    group.add_field({"name"=>"Column Right", "slug"=>"footer_right"}, {field_key: "editor", translate: true, default_value: "<h4>About Theme</h4><p>This cute theme was created to showcase your work in a simple way. Use it wisely.</p>"})

  end

  # callback executed after theme uninstalled
  def shoppy_on_uninstall_theme(theme)
    theme.destroy
  end
end
