/**
 * 用例说明：
 * 本用例是空数据用例
 * */

/** 数据 begin */
  // 时间区间
var timeRange = [1651075200, 1651161599]
/* 1.1 流量变化曲线 */
// sql-1 总流量
var totalTraffic = 0
// sql-2 字节跳动总流量
var targetTotalTraffic = 0
// sql-3 prev字节跳动总流量
var prevTargetTotalTraffic = 0
// sql-4 域外访问字节跳动总流量
var outToInTotalTraffic = 0
// sql-5 prev域外访问字节跳动总流量
var prevOutToInTotalTraffic = 0
// sql-6 字节跳动访问域外总流量
var inToOutTotalTraffic = 0
// sql-7 prev字节跳动访问域外总流量
var prevInToOutTotalTraffic = 0
// sql-8
var quantile1 = {
}
// sql-10 流量变化曲线
var trafficData = [
]

/* 2.1 各省份流量分布 */
// sql-19 Top 10省份流量分布（域外访问域内）
var top10ProvinceOutToInTraffic = [
]
// sql-20
var prevTop10ProvinceOutToInTraffic = [
]
// sql-21 Top 10省份流量分布（域内访问域外）
var top10ProvinceInToOutTraffic = [
]
// sql-22
var prevTop10ProvinceInToOutTraffic = [
]

/* 2.2 省内各地区流量分布 */
// sql-23（域外访问域内）
var top10CityOutToInTraffic = []
// sql-24
var prevTop10CityOutToInTraffic = []
// sql-25（域内访问域外）
var top10CityInToOutTraffic = []
// sql-26
var prevTop10CityInToOutTraffic = []

/* 3. 内容收敛情况 */
// sql-27 Top3 S2C总流量
var top3S2cTotalTraffic = []
// sql-28 未命中缓存S2C流量
var missedCacheS2cTraffic = []
// sql-29 Top3 会话总数
var top3Sessions = []
// sql-30 未命中缓存的会话
var missedCacheSession = []
/** 数据 end */
