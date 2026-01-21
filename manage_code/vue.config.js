// var webpack = require('webpack');
//vue2
const path = require('path')

function resolve(dir) {
	return path.join(__dirname, dir)
}

function publicPath() {
	if (process.env.NODE_ENV == 'production') {
		return "././";
	} else {
		return "/";
	}
}

module.exports = {
	publicPath: publicPath(),
	configureWebpack: {
	    resolve: {
	      fallback: { path: require.resolve("path-browserify") },
	    },
	},
	lintOnSave: false,
	devServer: {
		client:{
			overlay: false,
		},
		host: "0.0.0.0",
		port: 8081, // 前端端口
		hot: true,
		https: false,
		proxy: { 
            // 🔴 关键修改：这里强制把 /project 开头的请求转发给 8080 后端
			'/project': { 
				target: 'http://localhost:8080', 
				changeOrigin: true,
				secure: false,
				pathRewrite: {
					'^/project': '/project'
				}
			}
		}
	},
	chainWebpack(config) {
		config.module
			.rule('svg')
			.exclude.add(resolve('src/icons'))
			.end()
		config.module
			.rule('icons')
			.test(/\.svg$/)
			.include.add(resolve('src/icons'))
			.end()
			.use('svg-sprite-loader')
			.loader('svg-sprite-loader')
			.options({
				symbolId: 'icon-[name]'
			})
			.end()
	}
}
