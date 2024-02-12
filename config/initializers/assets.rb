# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Rails.application.config.assets.paths << Rails.root.join("node_modules/")

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w( application.js application.scss )

Rails.application.config.assets.precompile += %w( simplebar.min.scss )
Rails.application.config.assets.precompile += %w( flatpickr.min.scss )
Rails.application.config.assets.precompile += %w( theme-rtl.min.scss theme.min.scss )
Rails.application.config.assets.precompile += %w( user-rtl.scss user.min.scss )


Rails.application.config.assets.precompile += %w( simplebar.min.js )
Rails.application.config.assets.precompile += %w( theme.js theme.min.js config.js manifest.json)

Rails.application.config.assets.precompile += %w( popper.min.js )
Rails.application.config.assets.precompile += %w( all.min.js )
Rails.application.config.assets.precompile += %w( bootstrap.min.js )
Rails.application.config.assets.precompile += %w( anchor.min.js )
Rails.application.config.assets.precompile += %w( is.min.js )
Rails.application.config.assets.precompile += %w( echarts.min.js )
Rails.application.config.assets.precompile += %w( lodash.min.js )
Rails.application.config.assets.precompile += %w( list.min.js )
Rails.application.config.assets.precompile += %w( emoji-button.js )
Rails.application.config.assets.precompile += %w( flatpickr.js )
Rails.application.config.assets.precompile += %w( jquery.min.js )
Rails.application.config.assets.precompile += %w( funcoes.js )
