<template>
	<div>
		<div class="home_box">
			<!-- 关于我们 -->
			<div class="aboutUs_view">
				<div class="aboutUs_title"><span>{{aboutUsDetail.title}}</span></div>
				<div class="aboutUs_subtitle"><span>{{aboutUsDetail.subtitle}}</span></div>
				<div class="aboutUs_content"><div v-html="aboutUsDetail.content"></div></div>
				<div class="aboutUs_img_box">
					<img class="aboutUs_img1" :src="aboutUsDetail.picture1?$config.url + aboutUsDetail.picture1:''" alt="">
					<img class="aboutUs_img2" :src="aboutUsDetail.picture2?$config.url + aboutUsDetail.picture2:''" alt="">
					<img class="aboutUs_img3" :src="aboutUsDetail.picture3?$config.url + aboutUsDetail.picture3:''" alt="">
				</div>
				<div class="aboutUs_default1"></div>
				<div class="aboutUs_default2"></div>
				<div class="aboutUs_default3"></div>
				<div class="aboutUs_default4"></div>
			</div>
			<!-- 收费标准首页展示 -->
			<div class="homeList_view">
				<div class="homeList_title">
                    <span>收费标准展示</span>
                </div>
				<div class="homeList">
					<div class="item" v-for="(item,index) in shoufeibiaozhunHomeList" :key="index" @click="detailClick('shoufeibiaozhun',item.id)">
						<div class="img-box">
							<img v-if="isHttp(item.fengmian)" :src="item.fengmian.split(',')[0]" alt="">
							<img v-else :src="item.fengmian?$config.url + item.fengmian.split(',')[0]:''" alt="">
						</div>
						<div class="content-box">
							<div class="title">
								{{item.shoufeixiangmu}}
							</div>
							<div class="statistic">
								<div class="collect">
									<span class="iconfont icon-likeline4"></span>
									<div class="num">{{item.storeupNumber}}</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="homeList_more_view" @click="moreClick('shoufeibiaozhun')">
					<span class="homeList_more_text">更多 +</span>
				</div>
			</div>
			<!-- 汽车资讯 -->
			<div class="newsList_view">
				<div class="ntitle"> <div class="n1">汽车资讯</div> </div>
				
				    <div class="nlist">
				         <ul> 
				        <li v-for="(item,index) in newsList" :key="index" @click="newsDetailClick(item)">
				          
				          <div class="imgbox">
				                <img :src="item.imgUrl" >
				            </div>
				          
				          <div class="infobox">
				            <div class="nam">{{item.title}}</div>
				            <div class="info">{{item.introduction}}</div>
				          </div>
				          
				          <div class="tim"><div class="t2">{{moment(item.addtime).format('YYYY-MM-DD')}}</div></div>
				          
				        </li>
				         </ul> 
				    </div>
				
				<div class="nmore" @click="moreClick('news')" style="cursor: pointer">更多 +</div>
			</div>

		</div>
		<formModel ref="newsFormModelRef"></formModel>
	</div>
</template>

<script setup>
	import {
		ref,
		getCurrentInstance
	} from 'vue';
	import moment from 'moment'
	import {
		useRouter
	} from 'vue-router';
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const router = useRouter()
	//关于我们
	const aboutUsDetail = ref({})
	const getAboutUs = () => {
		context?.$http({
			url: 'aboutus/detail/1',
			method: 'get',
		}).then(res=>{
			aboutUsDetail.value = res.data.data
		})
	}
	//收费标准首页展示
	const shoufeibiaozhunHomeList = ref([])
	const getshoufeibiaozhunHomeList = () => {
		let params = {
			page: 1,
			limit: 6
		}
		context?.$http({
			url: 'shoufeibiaozhun/list',
			method: 'get',
			params: params
		}).then(res => {
			shoufeibiaozhunHomeList.value = res.data.data.list
			shoufeibiaozhunHomeList.value.forEach(item=>{
				if(!isHttp(item.fengmian)){
					item.imgUrls = item.fengmian.split(',').map(item=>context.$config.url+item)
				}
			})
		})
	}
	//汽车资讯弹窗
	import formModel from './news/formModel'
	const newsFormModelRef = ref(null)
	//汽车资讯
	const newsList = ref([])
	const getNewsList = () => {
		context?.$http({
			url: 'news/list',
			method: 'get',
			params:{
				page:1,
				limit: 6
			}
		}).then(res=>{
			newsList.value = res.data.data.list
			newsList.value.forEach(item=>{
				if(!isHttp(item.picture)){
					item.imgUrl=context.$config.url+item.picture.split(',')[0]
				}
			})
		})
	}
	const newsDetailClick = (item) => {
		if (item && item.id){
			newsFormModelRef.value.init(item.id)
		}
	}
	//判断图片链接是否带http
	const isHttp = (str) => {
        return str && str.substr(0,4)=='http';
    }
	//跳转详情
	const detailClick = (table,id) => {
		router.push(`/index/${table}Detail?id=${id}`)
	}
	const moreClick = (table) => {
		router.push(`/index/${table}List`)
	}
	const init = () => {
		getAboutUs()
		//收费标准首页展示
		getshoufeibiaozhunHomeList()
		//汽车资讯
		getNewsList()
	}
	init()
</script>

<style lang="scss">
	.home_box {
	}

	.aboutUs_view {
		.aboutUs_title {
		}

		.aboutUs_subtitle {
		}
		.aboutUs_content {
		}
		.aboutUs_img_box {
			.aboutUs_img1 {
			}

			.aboutUs_img2 {
			}

			.aboutUs_img3 {
			}
		}
		// 自定义盒子一
		.aboutUs_default1 {
			margin: 0 auto;
			background: #d5a1b1;
			display: none;
			width: 100px;
			height: 100px;
		}
		// 自定义盒子二
		.aboutUs_default2 {
			margin: 0 auto;
			background: #d5a1b1;
			display: none;
			width: 100px;
			height: 100px;
		}
		// 自定义盒子三
		.aboutUs_default3 {
			margin: 0 auto;
			background: #d5a1b1;
			display: none;
			width: 100px;
			height: 100px;
		}
		// 自定义盒子四
		.aboutUs_default4 {
			margin: 0 auto;
			background: #d5a1b1;
			display: none;
			width: 100px;
			height: 100px;
		}
	}
	// 推荐
	.recomList_view {
		.recomList_title {
		}
		// list
		.recommend_list_one {
			.recommend_item {
			}
			.recommend_img_box {
				.recommend_img {
				}
			}
			.recommend_content {
				.recommend_title {
				}
				.recommend_price {
				}
				.recommend_bottom {
					.recommend_like {
						.like_icon {
						}
						.num {
						}
					}
					.recommend_collect {
						.el-icon {
						}
						.num {
						}
					}
					.recommend_clickNum {
						color: #999;
						display: flex;
						font-size: 16px;
						align-items: center;
						.el-icon {
							margin: 0 4px 0 0;
							color: inherit;
						}
						.num {
							color: inherit;
						}
					}
				}
			}
		}
		// list
		// animation
		.animation_box {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			z-index: initial;
		}
		.animation_box:hover {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			-webkit-perspective: 1000px;
			perspective: 1000px;
			transition: 0.3s;
		}
		.animation_box img {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			z-index: initial;
		}
		.animation_box img:hover {
			transform: rotate(0deg) scale(1.05) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			-webkit-perspective: 1000px;
			perspective: 1000px;
			transition: 0.3s;
		}
		// animation
		// 更多
		.recommend_more_view {
			.recommend_more_text {
			}
		}
	}
	// 推荐
	// 新闻资讯
	.newsList_view {

		.newsList_title {
		}
		// list
		.news_list_one {
			display: flex;
			flex-wrap: wrap;
			.news_item {
				box-shadow: 0 4px 6px rgba(0,0,0,.3);
				margin: 0 10px 10px;
				background: #fff;
				display: flex;
				width: calc(33% - 20px);
				align-items: center;
				.news_img_box {
					width: 40%;
					font-size: 0;
					.news_img {
						object-fit: cover;
						width: 100%;
						height: 200px;
					}
				}
				.news_content {
					margin: 0 0 0 20px;
					width: calc(60% - 20px);
					.news_title {
						font-weight: bold;
						font-size: 20px;
					}
					.news_text {
						font-size: 14px;
						line-height: 1.5;
					}
					.news_time {
						color: #999;
						width: 100%;
						text-align: right;
					}
				}
			}
		}
		// list
		// animation
		.animation_box {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			z-index: initial;
		}
		.animation_box:hover {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			-webkit-perspective: 1000px;
			perspective: 1000px;
			transition: 0.3s;
		}
		.animation_box img {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			z-index: initial;
		}
		.animation_box img:hover {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			-webkit-perspective: 1000px;
			perspective: 1000px;
			transition: 0.3s;
		}
		// animation
		// 更多
		.news_more_view {
			.news_more_text {
			}
			.el-icon {
			}
		}
	}
	// 新闻资讯
	// 首页展示
	.homeList_view {

		.homeList_title {
		}
		// list
		// list
		// animation
		.animation_box {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			z-index: initial;
		}
		.animation_box:hover {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			-webkit-perspective: 1000px;
			perspective: 1000px;
			transition: 0.3s;
		}
		.animation_box img {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			z-index: initial;
		}
		.animation_box img:hover {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			-webkit-perspective: 1000px;
			perspective: 1000px;
			transition: 0.3s;
		}
		// animation
		// 更多
		.homeList_more_view {
			cursor: pointer;
			.homeList_more_text {
			}
		}
	}
	// 首页展示
</style>
<style>
.home_box{
    width: 100%;
    margin: 0px auto;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    background: #fff;
}
/* 总盒子 */
.aboutUs_view {
    width: 100%;
    margin:0;
    padding: 20px calc((100% - 1200px)/2) 60px;
    background: #fff;
    overflow: hidden;
    position:relative;
    order: 1;
    display: block;
}
.aboutUs_view .aboutUs_title{
    display: block;
    font-size: 24px;
    font-weight: 500;
    background:none;
    color: #333;
    width: calc(62% - 500px);
    text-align: center;
    margin:20px 0 0;
    position:absolute;
    left:calc((100% - 1180px)/2);
    top:0;
}
.aboutUs_view .aboutUs_subtitle{
    display:none;
    font-size: 28px;
    line-height:30px;
    color:#ff6637;
}
/* 内容 */
.aboutUs_view .aboutUs_content{
    width: calc(100% - 500px);
    padding: 0px;
    border: 0px solid rgb(238, 238, 238);
    font-size: 14px;
    color: rgb(102, 102, 102);
    line-height: 24px;
    height: 288px;
    overflow:hidden;
    text-indent: 2em;
    float:left;
    margin:40px 0 0;
    background:none;
}
.aboutUs_view .aboutUs_img_box{
    display: inline-block;
    width: 450px; 
    height: 320px;
    float:right;
    margin: 0px 0 0;
}
.aboutUs_view .aboutUs_img_box .aboutUs_img1{
    width: 100%; 
    height: 100%;
    object-fit:cover;
}
.aboutUs_view .aboutUs_img_box .aboutUs_img2{
    display: none;
}
.aboutUs_view .aboutUs_img_box .aboutUs_img3{
    display: none;
}
/* 自定义盒子 */
.aboutUs_view .aboutUs_default1{
    width: 100px;
    height: 100px;
    background: rgb(213, 161, 177);
    margin: 0px auto;
    display: none;
}
/* 更多 */
.aboutUs_view .more{
    position: absolute;
    right: calc((100% - 1180px) / 2);
    bottom: 80px;
}

/* 总盒子 */
.homeList_view{
    width: 100%;
    margin:0;
    padding: 20px calc((100% - 1200px)/2) 50px;
    background: #fff ;
    overflow: hidden;
    position:relative;
    order: 8;
    display:flex;
    flex-wrap:wrap;
    justify-content:space-between;
}
/* 标题 */
.homeList_view .homeList_title{
    width: 101%;
    text-align: left;
    font-size: 22px;
    color: #333;
    margin: 0px 0px 20px;
    border-left:4px solid #d00;
    padding-left:10px;
}
/* 分类 */
.homeList_view .categoryList{
    width: 100%;
    display: block;
    flex-wrap: wrap;
}
.homeList_view .categoryList .item{
    display:inline-block;
    background: none;
    line-height:50px;
    color:#333;
    text-align: center;
    margin:0 20px 0 0;
    padding:0 20px;
    cursor:pointer;
    font-size: 16px;
}
.homeList_view .categoryList .item:hover{
    background:#d00;
    color:#fff;
}

/* 样式七 总盒子 */
.homeList_view .homeList{
    width: calc(100% - 0px);
    margin: 20px 0 0;
    display: flex;
    flex-wrap: wrap;
    justify-content:space-between;
    order:2;
}
.homeList_view .homeList .item{
    width: calc(32% - 0px);
    margin: 0px 0px 20px;
    background: none;
    cursor: pointer;
    overflow:hidden;
    position:relative;
}
.homeList_view .homeList .item .img-box{
    width: 100%;
    height: 250px;
    overflow: hidden;
    margin: 0 0 5px;
    text-align:center;
}
.homeList_view .homeList .item .img-box img{
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.homeList_view .homeList .item .content-box{
    width: 100%;
}
.homeList_view .homeList .item:hover .content-box{  }

.homeList_view .homeList .item .content-box .title{
    width: 100%;
    line-height: 24px;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
    text-align:center;
}
.homeList_view .homeList .item:hover .content-box .title{
}
.homeList_view .homeList .item .content-box .price{
    width: 100%;
    text-align:right;
    color: #f00;
    font-size:16px;
}
.homeList_view .homeList .item:hover .content-box .price{
}
.homeList_view .homeList .item .content-box .statistic{
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin:10px 0 0;
    color: #888;
}
.homeList_view .homeList .item:hover .content-box .statistic{
}
.homeList_view .homeList .item .content-box .statistic .iconfont{
    color: inherit;
    margin: 0px 4px 0px 0px;
}
.homeList_view .homeList .item .content-box .statistic .num{
    color: inherit;
}
.homeList_view .homeList .item .content-box .statistic .like{
    display: flex;
    align-items: center;
    color: inherit;
    font-size: 16px;
    margin: 0px 10px 0px 0px;
}
.homeList_view .homeList .item .content-box .statistic .collect{
    display: flex;
    align-items: center;
    color: inherit;
    font-size: 16px;
    margin: 0px 10px 0px 0px;
}
.homeList_view .homeList .item .content-box .statistic .clickNum{
    display: flex;
    align-items: center;
    color: inherit;
    font-size: 16px;
    margin: 0px 10px 0px 0px;
}

/* 更多 */
.homeList_view .homeList_more_view{
    width: auto;
    margin: 0px;
    cursor: pointer;
    font-size: 16px;
    color: rgb(51, 51, 51);
    text-align: center;
    background: none;
    display: inline-block;
    padding: 0px;
    position: absolute;
    top: 26px;
    right: calc((100% - 1220px) / 2);
}
.homeList_view .homeList_more_view .homeList_more_text{
    cursor: pointer;
    font-size: 16px;
    color: rgb(51, 51, 51);
    text-align: center;
}
/* 总盒子 */
.newsList_view {
    width: 100%;
    margin:0;
    padding: 0px 0;
    background: #fff;
    overflow: hidden;
    position:relative;
    order: 2;
    display:block;
}
/* 自定义 start*/
.newsList_view .ntitle{
    width: 1200px;
    margin: 0px auto 20px;
    border-left:4px solid #d00;
    padding-left:10px;
}
.newsList_view .ntitle .n1{
    display:block;
    text-align: left;
    font-size: 22px;
    color: #333;
}
.newsList_view .ntitle .n2{
    display:block;
    font-size: 18px;
    line-height:30px;
    color:#ccc;
    margin-left:5px;
}
.newsList_view .nlist{
    width: 1200px;
    margin:30px auto 0;
}
.newsList_view .nlist ul{
    margin:0;
    padding:0;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    align-content: flex-start;
}
.newsList_view .nlist ul li{
    width: calc(32% - 0px);
    text-align: left;
    background: none;
    border: 0px dashed #aaa;
    cursor:pointer;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: space-between;
    margin:0 2% 30px 0;
}
.newsList_view .nlist ul li:nth-child(3n){
    margin-right:0px; 
}
.newsList_view .nlist ul li .imgbox{
    width: 100%;
    height: 220px;
    margin-bottom:5px; 
}
.newsList_view .nlist ul li .imgbox img{
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.newsList_view .nlist ul li .tim {
    display: flex;
    flex-wrap: wrap;
    width: 100%;
}
.newsList_view .nlist ul li .tim .t1 {
    width: 100%;
    text-align: left;
    font-size: 48px;
    line-height: 1;
    border-bottom:1px solid #ddd;
    color: #ddd;
}
.newsList_view .nlist ul li .tim .t2 {
    width: 100%;
    text-align: left;
    line-height: 30px;
    color: #999;
}
.newsList_view .nlist ul li .infobox {
    width: calc(100% - 0px);
    padding:0;
}
.newsList_view .nlist ul li .infobox .nam {
    color: #333;
    font-size: 15px;
    font-weight: 600;
    line-height: 24px;
    width:100%; 
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}
.newsList_view .nlist ul li .infobox .info {
    color: #888;
    font-size: 15px;
    line-height: 24px;
    height:48px;
    overflow:hidden;
    margin-top: 5px;
}

/* 更多 */
.newsList_view .nmore{
    width: auto;
    margin: 0px;
    cursor: pointer;
    font-size: 16px;
    color:#333;
    text-align: center;
    background: none;
    display: inline-block;
    padding: 0px;
    position: absolute;
    top: 6px;
    right: calc((100% - 1220px) / 2);
}
/* 自定义 end*/

</style>