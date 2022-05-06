<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>字节跳动网络服务质量监测报告(IDC精简版)</title>
  <script src="http://${uiStaticUrl}/assets/echarts.min.js"></script>
  <style>
    * {
      box-sizing: border-box;
    }
    body {
      width: 1200px;
      margin: auto;
      padding-bottom: 50px;
    }
    .indent-3 {
      padding-left: 50px;
      padding-right: 50px;
    }
    .header1, .header2, .header3, .header4 {
      font-weight: bold;
    }
    .header1 {
      display: flex;
      justify-content: center;
      align-items: center;
      margin-bottom: 10px;
      height: 100px;
      color: white;
      background-color: rgb(0,116,159);
      font-size: 34px;
    }
    .header1 .header1__time {
      padding-top: 6px;
      padding-left: 30px;
      font-size: 18px;
      font-weight: normal;
      font-style: italic;
    }
    .header2 {
      margin: 30px 0 20px;
      padding: 0 30px;
      color: rgb(51,51,51);
      font-size: 20px;
    }
    .header3 {
      margin: 20px 0;
      padding: 0 43px;
      color: rgb(0,116,159);
      font-size: 18px;
    }
    .header4 {
      margin-bottom: 10px;
      padding-left: 10px;
      font-size: 14px;
      color: rgba(0,0,0,0.85);;
    }
    .text {
      color: rgb(74,74,74);
      font-size: 16px;
      line-height: 24px;
      text-indent: 32px;
    }
    .text .fill {
      color: black;
      padding: 0 3px;
    }

    .table-box {
      padding-top: 10px;
      padding-bottom: 10px;
    }
    .table__title {
      font-size: 14px;
      color: rgba(0,0,0,0.85);
      padding-bottom: 10px;
      text-align: center;
    }
    .table {
      width: 100%;
      text-align: center;
      border: 1px solid rgb(222,222,222);
      border-radius: 4px;
      border-collapse: collapse;
    }
    .table__td {
      border: 1px solid rgb(222,222,222);
      color: rgb(38,38,38);
      font-size: 16px;
      padding: 8px 0;
    }
    .font-size-14 .table__td {
      font-size: 14px;
    }
    .td__quantile-group {
      padding: 8px 0;
      display: table;
      width: 100%;
    }
    .td__quantile-group .td__quantile {
      /*display: flex;
      align-items: center;
      justify-content: center;
      flex: 0 0 200px;*/
      display: table-row;
    }
    .td__quantile-group .td__quantile:last-of-type {
      border-bottom: none;
    }
    .quantile__label {
      display: table-cell;
      color: rgb(122,122,122);
      font-size: 14px;
      width: 50%;
    }
    .quantile__value {
      display: table-cell;
      width: 50%;
      font-size: 14px;
      text-align: left;
      vertical-align: middle;
    }
    .quantile__label .quantile__point {
      margin-right: 10px;
      width: 6px;
      height: 6px;
      border-radius: 50%;
    }
    .label-box {
      display: flex;
      justify-content: right;
      align-items: center;
      padding-right: 15px;
    }
    .quantile__point.quantile__point--p50 {
      background-color: rgb(35,191,154);
    }
    .quantile__point.quantile__point--p90 {
      background-color: rgb(255,162,0);
    }
    .quantile__point.quantile__point--p99 {
      background-color: rgb(236,127,106);
    }
    .table__th {
      height: 47px;
      border: 1px solid rgb(222,222,222);
      background-color: rgb(250,250,250);
      color: rgb(102,102,102);
      font-weight: normal;
      font-size: 14px;
    }
    .table__footer {
      display: flex;
      font-size: 14px;
      color: rgb(102,102,102);
    }
    .table__footer .footer__label {
      color: rgb(51,51,51);
    }
    .table.table-contain-echarts {
      margin-top: 20px;
      margin-bottom: 4px;
    }
    .table.table-contain-echarts .echarts-box {
      height: 200px;
    }
    .table.table-contain-echarts .echarts__canvas {
      height: 100%;
    }

    .echarts-box {
      display: flex;
      flex-wrap: wrap;
    }
    .echarts {
      flex: 1;
    }
    .echarts__legends {
      display: flex;
      justify-content: center;
      margin-bottom: 5px;
    }
    .echarts__legend {
      display: flex;
      align-items: center;
    }
    .echarts__legend:first-of-type {
      margin-right: 10px;
    }
    .color-block {
      width: 16px;
      height: 8px;
      border-radius: 2px;
      margin-right: 4px;
    }
    .color-block.blue {
      background-color: rgb(88,176,209);
    }
    .color-block.green {
      background-color: rgb(140,206,213);
    }
    .legend-text {
      font-size: 12px;
      color: rgb(102,102,102);
    }
    .echarts__title {
      font-size: 14px;
      color: rgba(0,0,0,0.85);
      padding-bottom: 10px;
      text-align: center;
    }
  </style>
</head>
<body>
  <div class="header1">字节跳动网络服务质量监测报告(IDC精简版)<span class="header1__time" id="currentRange0"></span></div>
  <div class="header2">一.整体流量概况</div>
  <div class="header3">1.流量规模概况</div>
  <div class="table-box indent-3">
    <div class="table__title">表1 整体流量概况</div>
    <table class="table">
      <thead class="table__header">
        <tr class="table__tr">
          <th class="table__th">速率均值</th>
          <th class="table__th">速率谷值</th>
          <th class="table__th">速率分位值</th>
          <th class="table__th">速率峰值</th>
          <th class="table__th">速率均值环比</th>
          <th class="table__th">总流量</th>
          <th class="table__th">总流量占比</th>
          <th class="table__th">总流量环比</th>
        </tr>
      </thead>
      <tr class="table__tr">
        <td class="table__td">${convertNumber(xxxServiceRate[0].rate_avg,'bps',1000)}</td>
        <td class="table__td">${convertNumber(xxxServiceRate[0].rate_min,'bps',1000)}</td>
        <td class="table__td">
          <div class="td__quantile-group">
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p50"></div>
                  <div>P50</div>
                </div>
              </div>
              <div class="quantile__value">${convertNumber(xxxServiceRate[0].rate50,'bps',1000)}</div>
            </div>
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p90"></div>
                  <div>P90</div>
                </div>
              </div>
              <div class="quantile__value">${convertNumber(xxxServiceRate[0].rate90,'bps',1000)}</div>
            </div>
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p99"></div>
                  <div>P99</div>
                </div>
              </div>
              <div class="quantile__value">${convertNumber(xxxServiceRate[0].rate99,'bps',1000)}</div>
            </div>
          </div>
        </td>
        <td class="table__td">${convertNumber(xxxServiceRate[0].rate_max?eval,'bps',1000)}</td>
        <td class="table__td">
			${(xxxServiceRate[0].rate_avg - preXxxServiceRate[0].rate_avg) / preXxxServiceRate[0].rate_avg * 100}%
		</td>
        <td class="table__td">${convertNumber(xxxServiceTrafficTotal[0].bytes?eval,'byte',1024)}</td>
        <td class="table__td">${xxxServiceTrafficTotal[0].bytes?eval / trafficTotal[0].bytes?eval * 100}%</td>
        <td class="table__td">
			${(xxxServiceTrafficTotal[0].bytes?eval  - preXxxServiceTrafficTotal[0].bytes?eval) / preXxxServiceTrafficTotal[0].bytes?eval * 100}%
		</td>
      </tr>
    </table>
    <div class="table__footer" style="margin-top: 20px;">
      <div class="footer__label">* 流量速率分位值计算方式：</div>以5分钟为时间粒度计算平均流量速率vi，取观测时间范围内的{v1, v2, v3……vn}的分位值，下同。
    </div>
    <div class="table__footer">
      <div class="footer__label">* 环比计算方式：</div>计算当前统计值与上一个统计周期（一天前）的统计值相比的变化率，下同。
    </div>
  </div>
  <div class="echarts-box indent-3">
    <div class="echarts">
      <div class="echarts__canvas" id="canvas1" style="width: 1100px; height: 400px; display: none;"></div>
      <img height="400" width="1100" id="imgCanvas1"/>
      <div class="echarts__title">图1 字节跳动服务当日流量变化曲线</div>
    </div>
  </div>

  <div class="header3">2.服务质量概况</div>
  <div class="table-box indent-3">
    <div class="table__title">表2 域外访问字节跳动服务的服务质量</div>
    <table class="table">
      <thead class="table__header">
      <tr class="table__tr">
        <th class="table__th">服务质量指标</th>
        <th class="table__th">分位值</th>
        <th class="table__th">峰值</th>
        <th class="table__th">均值</th>
        <th class="table__th">均值环比</th>
      </tr>
      </thead>
      <tr class="table__tr">
        <td class="table__td">TCP会话创建延迟</td>
        <td class="table__td">
          <div class="td__quantile-group">
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p50"></div>
                  <div>P50</div>
                </div>
              </div>
              <div class="quantile__value">${convertTime(outOfXxxServiceTCP[0].establish_latency_p50)}</div>
            </div>
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p90"></div>
                  <div>P90</div>
                </div>
              </div>
              <div class="quantile__value">${convertTime(outOfXxxServiceTCP[0].establish_latency_p90)}</div>
            </div>
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p99"></div>
                  <div>P99</div>
                </div>
              </div>
              <div class="quantile__value">${convertTime(outOfXxxServiceTCP[0].establish_latency_p99)}</div>
            </div>
          </div>
        </td>
        <td class="table__td">${convertTime(outOfXxxServiceTCP[0].establish_latency_max)}</td>
        <td class="table__td">${convertTime(outOfXxxServiceTCP[0].establish_latency_avg)}</td>
        <td class="table__td">
			<#if preOutOfXxxServiceTCP[0].establish_latency_avg?? && preOutOfXxxServiceTCP[0].establish_latency_avg!=0>
				${(outOfXxxServiceTCP[0].establish_latency_avg - preOutOfXxxServiceTCP[0].establish_latency_avg) / preOutOfXxxServiceTCP[0].establish_latency_avg * 100}%
			<#else>
			 0%
			</#if>
		</td>
      </tr>
      <tr class="table__tr">
        <td class="table__td">缺包率</td>
        <td class="table__td">
          <div class="td__quantile-group">
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p50"></div>
                  <div>P50</div>
                </div>
              </div>
              <div class="quantile__value">${outOfXxxServiceLoss[0].sequence_gap_loss_p50 * 100}%</div>
            </div>
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p90"></div>
                  <div>P90</div>
                </div>
              </div>
              <div class="quantile__value">${outOfXxxServiceLoss[0].sequence_gap_loss_p90 * 100}%</div>
            </div>
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p99"></div>
                  <div>P99</div>
                </div>
              </div>
              <div class="quantile__value">${outOfXxxServiceLoss[0].sequence_gap_loss_p99 * 100}%</div>
            </div>
          </div>
        </td>
        <td class="table__td">${outOfXxxServiceLoss[0].sequence_gap_loss_max * 100}%</td>
        <td class="table__td">${outOfXxxServiceLoss[0].sequence_gap_loss_avg * 100}%</td>
        <td class="table__td">
			<#if preOutOfXxxServiceLoss[0].establish_latency_avg?? && preOutOfXxxServiceLoss[0].establish_latency_avg!=0>
				${(outOfXxxServiceLoss[0].establish_latency_avg - preOutOfXxxServiceLoss[0].establish_latency_avg) / preOutOfXxxServiceLoss[0].establish_latency_avg * 100}%
			<#else>
			 0%
			</#if>
		</td>
      </tr>
    </table>
  </div>
  <div class="table-box indent-3">
    <div class="table__title">表3 域内字节跳动对应网段访问域外服务的服务质量</div>
    <table class="table">
      <thead class="table__header">
      <tr class="table__tr">
        <th class="table__th">服务质量指标</th>
        <th class="table__th">分位值</th>
        <th class="table__th">峰值</th>
        <th class="table__th">均值</th>
        <th class="table__th">均值环比</th>
      </tr>
      </thead>
      <tr class="table__tr">
        <td class="table__td">TCP会话创建延迟</td>
        <td class="table__td">
          <div class="td__quantile-group">
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p50"></div>
                  <div>P50</div>
                </div>
              </div>
              <div class="quantile__value">${convertTime(xxxServiceOfOutTCP[0].establish_latency_p50)}</div>
            </div>
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p90"></div>
                  <div>P90</div>
                </div>
              </div>
              <div class="quantile__value">${convertTime(xxxServiceOfOutTCP[0].establish_latency_p90)}</div>
            </div>
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p99"></div>
                  <div>P99</div>
                </div>
              </div>
              <div class="quantile__value">${convertTime(xxxServiceOfOutTCP[0].establish_latency_p99)}</div>
            </div>
          </div>
        </td>
        <td class="table__td">${convertTime(xxxServiceOfOutTCP[0].establish_latency_max)}</td>
        <td class="table__td">${convertTime(xxxServiceOfOutTCP[0].establish_latency_avg)}</td>
        <td class="table__td">
			<#if preXxxServiceOfOutTCP[0].establish_latency_avg?? && preXxxServiceOfOutTCP[0].establish_latency_avg!=0>
				${(xxxServiceOfOutTCP[0].establish_latency_avg - preXxxServiceOfOutTCP[0].establish_latency_avg) / preXxxServiceOfOutTCP[0].establish_latency_avg * 100}%
			<#else>
			 0%
			</#if>
		</td>
      </tr>
      <tr class="table__tr">
        <td class="table__td">缺包率</td>
        <td class="table__td">
          <div class="td__quantile-group">
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p50"></div>
                  <div>P50</div>
                </div>
              </div>
              <div class="quantile__value">${xxxServiceOfOutLoss[0].sequence_gap_loss_p50 * 100}%</div>
            </div>
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p90"></div>
                  <div>P90</div>
                </div>
              </div>
              <div class="quantile__value">${xxxServiceOfOutLoss[0].sequence_gap_loss_p90 * 100}%</div>
            </div>
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p99"></div>
                  <div>P99</div>
                </div>
              </div>
              <div class="quantile__value">${xxxServiceOfOutLoss[0].sequence_gap_loss_p99 * 100}%</div>
            </div>
          </div>
        </td>
        <td class="table__td">${xxxServiceOfOutLoss[0].sequence_gap_loss_max * 100}%</td>
        <td class="table__td">${xxxServiceOfOutLoss[0].sequence_gap_loss_avg * 100}%</td>
        <td class="table__td">
			<#if preXxxServiceOfOutLoss[0].establish_latency_avg?? && preXxxServiceOfOutLoss[0].establish_latency_avg!=0>
				${(xxxServiceOfOutLoss[0].establish_latency_avg - preXxxServiceOfOutLoss[0].establish_latency_avg) / preXxxServiceOfOutLoss[0].establish_latency_avg * 100}%
			<#else>
			 0%
			</#if>
		</td>
      </tr>
    </table>
  </div>

  <div class="header2">二.地理位置分布</div>
  <div class="header3">1.各省份流量分布</div>
  <div class="echarts-box indent-3">
    <div class="echarts">
      <div class="echarts__canvas" id="canvas2" style="width: 1100px; height: 400px; display: none;"></div>
      <img height="400" width="1100" id="imgCanvas2"/>
    </div>
  </div>
  <div class="table-box indent-3">
    <table class="table">
      <thead class="table__header">
      <tr class="table__tr">
        <th class="table__th">各省份流量速率</th>
		<#if top10ProvinceOutOfXxxService??>
			<#list top10ProvinceOutOfXxxService as val>
				<th class="table__th">${val['client_province']}</th>
			</#list>
		</#if>
      </tr>
      </thead>
      <tr class="table__tr font-size-14">
        <td class="table__td">上行峰值</td>
        <#if top10ProvinceOutOfXxxService??>
			<#list top10ProvinceOutOfXxxService as val>
				<td class="table__td">${convertNumber(val['egress_rate_max'],'bps',1000)}</td>
			</#list>
		</#if>
      </tr>
	  
      <tr class="table__tr font-size-14">
        <td class="table__td">上行均值</td>
        <#if top10ProvinceOutOfXxxService??>
			<#list top10ProvinceOutOfXxxService as val>
				<td class="table__td">${convertNumber(val['egress_rate_avg'],'bps',1000)}</td>
			</#list>
		</#if>
      </tr>
	  
    </table>
    <div class="echarts__title" style="padding-top: 10px;">图2 域外访问字节跳动服务的TOP10省份流量分布</div>
  </div>
  
  <div class="echarts-box indent-3">
      <div class="echarts">
          <div class="echarts__canvas" id="canvas8" style="width: 1100px; height: 400px; display: none; -webkit-tap-highlight-color: transparent; user-select: none;" _echarts_instance_="ec_1651217214144"><div style="position: relative; width: 1100px; height: 400px; padding: 0px; margin: 0px; border-width: 0px;"><canvas data-zr-dom-id="zr_0" width="1100" height="400" style="position: absolute; left: 0px; top: 0px; width: 1100px; height: 400px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div></div>
          <img height="400" width="1100" id="imgCanvas8">
      </div>
  </div>
  <div class="table-box indent-3">
      <table class="table">
          <thead class="table__header">
          <tr class="table__tr">
              <th class="table__th">各省份流量速率</th>
              <#if top10ProvinceOutOfXxxService??>
					<#list top10ProvinceOutOfXxxService as val>
						<th class="table__th">${val['client_province']}</th>
					</#list>
				</#if>
          </tr>
          </thead>
          <tbody>
          <tr class="table__tr font-size-14">
			<td class="table__td">下行峰值</td>
			<#if top10ProvinceOutOfXxxService??>
				<#list top10ProvinceOutOfXxxService as val>
					<td class="table__td">${convertNumber(val['ingress_rate_max'],'bps',1000)}</td>
				</#list>
			</#if>
		  </tr>
          <tr class="table__tr font-size-14">
			<td class="table__td">下行均值</td>
			<#if top10ProvinceOutOfXxxService??>
				<#list top10ProvinceOutOfXxxService as val>
					<td class="table__td">${convertNumber(val['ingress_rate_avg'],'bps',1000)}</td>
				</#list>
			</#if>
		  </tr>
          </tbody></table>
      <div class="echarts__title" style="padding-top: 10px;">图3 域外访问字节跳动服务的TOP10省份流量分布</div>
  </div>
  
  
  <div class="echarts-box indent-3">
    <div class="echarts">
      <div class="echarts__canvas" id="canvas3" style="width: 1100px; height: 400px; display: none;"></div>
      <img height="400" width="1100" id="imgCanvas3"/>
    </div>
  </div>
  <div class="table-box indent-3">
    <table class="table">
      <thead class="table__header">
      <tr class="table__tr">
        <th class="table__th">各省份流量速率</th>
        <#if top10ProvinceXxxServiceOfOut??>
			<#list top10ProvinceXxxServiceOfOut as val>
				<th class="table__th">${val['server_province']}</th>
			</#list>
		</#if>
      </tr>
      </thead>
      <tr class="table__tr font-size-14">
        <td class="table__td">上行峰值</td>
        <#if top10ProvinceXxxServiceOfOut??>
			<#list top10ProvinceXxxServiceOfOut as val>
				<td class="table__td">${convertNumber(val['egress_rate_max'],'bps',1000)}</td>
			</#list>
		</#if>
      </tr>
	  
      <tr class="table__tr font-size-14">
        <td class="table__td">上行均值</td>
        <#if top10ProvinceXxxServiceOfOut??>
			<#list top10ProvinceXxxServiceOfOut as val>
				<td class="table__td">${convertNumber(val['egress_rate_avg'],'bps',1000)}</td>
			</#list>
		</#if>
      </tr>
	  
    </table>
    <div class="echarts__title" style="padding-top: 10px;">图4 字节跳动服务对应网段访问域外服务的TOP10省份流量分布</div>
  </div>

  <div class="echarts-box indent-3">
      <div class="echarts">
          <div class="echarts__canvas" id="canvas9" style="width: 1100px; height: 400px; display: none; -webkit-tap-highlight-color: transparent; user-select: none;" _echarts_instance_="ec_1651217214145"><div style="position: relative; width: 1100px; height: 400px; padding: 0px; margin: 0px; border-width: 0px;"><canvas data-zr-dom-id="zr_0" width="1100" height="400" style="position: absolute; left: 0px; top: 0px; width: 1100px; height: 400px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div></div>
          <img height="400" width="1100" id="imgCanvas9">
      </div>
  </div>
  <div class="table-box indent-3">
      <table class="table">
          <thead class="table__header">
          <tr class="table__tr">
              <th class="table__th">各省份流量速率</th>
              <#if top10ProvinceXxxServiceOfOut??>
				<#list top10ProvinceXxxServiceOfOut as val>
					<th class="table__th">${val['server_province']}</th>
				</#list>
			</#if>
          </tr>
          </thead>
          <tbody>
          <tr class="table__tr font-size-14">
			<td class="table__td">下行峰值</td>
			<#if top10ProvinceXxxServiceOfOut??>
				<#list top10ProvinceXxxServiceOfOut as val>
					<td class="table__td">${convertNumber(val['ingress_rate_max'],'bps',1000)}</td>
				</#list>
			</#if>
		  </tr>
          <tr class="table__tr font-size-14">
			<td class="table__td">下行均值</td>
			<#if top10ProvinceXxxServiceOfOut??>
				<#list top10ProvinceXxxServiceOfOut as val>
					<td class="table__td">${convertNumber(val['ingress_rate_avg'],'bps',1000)}</td>
				</#list>
			</#if>
		  </tr>
          </tbody></table>
      <div class="echarts__title" style="padding-top: 10px;">图5 字节跳动服务对应网段访问域外服务的TOP10省份流量分布</div>
  </div>


  <div class="header3">2.省内各地区流量分布</div>
  <div class="echarts-box indent-3">
    <div class="echarts">
      <div class="echarts__canvas" id="canvas4" style="width: 1100px; height: 400px; display: none;"></div>
      <img height="400" width="1100" id="imgCanvas4"/>
    </div>
  </div>
  <div class="table-box indent-3">
    <table class="table">
      <thead class="table__header">
      <tr class="table__tr">
        <th class="table__th">各地区流量速率</th>
        <#if top10RegionOutOfXxxService??>
			<#list top10RegionOutOfXxxService as val>
				<th class="table__th">${val['client_region']}</th>
			</#list>
		</#if>
      </tr>
      </thead>
      <tr class="table__tr font-size-14">
        <td class="table__td">上行峰值</td>
        <#if top10RegionOutOfXxxService??>
			<#list top10RegionOutOfXxxService as val>
				<td class="table__td">${convertNumber(val['egress_rate_max'],'bps',1000)}</td>
			</#list>
		</#if>
      </tr>
	  
      <tr class="table__tr font-size-14">
        <td class="table__td">上行均值</td>
        <#if top10RegionOutOfXxxService??>
			<#list top10RegionOutOfXxxService as val>
				<td class="table__td">${convertNumber(val['egress_rate_avg'],'bps',1000)}</td>
			</#list>
		</#if>
      </tr>
	  
    </table>
    <div class="echarts__title" style="padding-top: 10px;">图6 域外访问字节跳动服务的TOP10省内地区流量分布</div>
  </div>
  
  <div class="echarts-box indent-3">
      <div class="echarts">
          <div class="echarts__canvas" id="canvas10" style="width: 1100px; height: 400px; display: none; -webkit-tap-highlight-color: transparent; user-select: none;" _echarts_instance_="ec_1651217214146"><div style="position: relative; width: 1100px; height: 400px; padding: 0px; margin: 0px; border-width: 0px;"><canvas data-zr-dom-id="zr_0" width="1100" height="400" style="position: absolute; left: 0px; top: 0px; width: 1100px; height: 400px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div></div>
          <img height="400" width="1100" id="imgCanvas10">
      </div>
  </div>
  <div class="table-box indent-3">
      <table class="table">
          <thead class="table__header">
          <tr class="table__tr">
              <th class="table__th">各地区流量速率</th>
              <#if top10RegionOutOfXxxService??>
				<#list top10RegionOutOfXxxService as val>
					<th class="table__th">${val['client_region']}</th>
				</#list>
			</#if>
          </tr>
          </thead>
          <tbody>
          <tr class="table__tr font-size-14">
			<td class="table__td">下行峰值</td>
			<#if top10RegionOutOfXxxService??>
				<#list top10RegionOutOfXxxService as val>
					<td class="table__td">${convertNumber(val['ingress_rate_max'],'bps',1000)}</td>
				</#list>
			</#if>
		  </tr>
          <tr class="table__tr font-size-14">
			<td class="table__td">下行均值</td>
			<#if top10RegionOutOfXxxService??>
				<#list top10RegionOutOfXxxService as val>
					<td class="table__td">${convertNumber(val['ingress_rate_avg'],'bps',1000)}</td>
				</#list>
			</#if>
		  </tr>
          </tbody></table>
      <div class="echarts__title" style="padding-top: 10px;">图7 域外访问字节跳动服务的TOP10省内地区流量分布</div>
  </div>
  
  
  <div class="echarts-box indent-3">
    <div class="echarts">
      <div class="echarts__canvas" id="canvas5" style="width: 1100px; height: 400px; display: none;"></div>
      <img height="400" width="1100" id="imgCanvas5"/>
    </div>
  </div>
  <div class="table-box indent-3">
    <table class="table">
      <thead class="table__header">
      <tr class="table__tr">
        <th class="table__th">各地区流量速率</th>
        <#if top10RegionXxxServiceOfOut??>
			<#list top10RegionXxxServiceOfOut as val>
				<th class="table__th">${val['server_region']}</th>
			</#list>
		</#if>
      </tr>
      </thead>
      <tr class="table__tr font-size-14">
        <td class="table__td">上行峰值</td>
        <#if top10RegionXxxServiceOfOut??>
			<#list top10RegionXxxServiceOfOut as val>
				<td class="table__td">${convertNumber(val['egress_rate_max'],'bps',1000)}</td>
			</#list>
		</#if>
      </tr>
	  
      <tr class="table__tr font-size-14">
        <td class="table__td">上行均值</td>
        <#if top10RegionXxxServiceOfOut??>
			<#list top10RegionXxxServiceOfOut as val>
				<td class="table__td">${convertNumber(val['egress_rate_avg'],'bps',1000)}</td>
			</#list>
		</#if>
      </tr>
	  
    </table>
    <div class="echarts__title" style="padding-top: 10px;">图8 字节跳动服务对应网段访问域外服务的TOP10省内地区流量分布</div>
  </div>
  
  <div class="echarts-box indent-3">
      <div class="echarts">
          <div class="echarts__canvas" id="canvas11" style="width: 1100px; height: 400px; display: none; -webkit-tap-highlight-color: transparent; user-select: none;" _echarts_instance_="ec_1651217214147"><div style="position: relative; width: 1100px; height: 400px; padding: 0px; margin: 0px; border-width: 0px;"><canvas data-zr-dom-id="zr_0" width="1100" height="400" style="position: absolute; left: 0px; top: 0px; width: 1100px; height: 400px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div></div>
          <img height="400" width="1100" id="imgCanvas11">
      </div>
  </div>
  <div class="table-box indent-3">
      <table class="table">
          <thead class="table__header">
          <tr class="table__tr">
              <th class="table__th">各地区流量速率</th>
              <#if top10RegionXxxServiceOfOut??>
				<#list top10RegionXxxServiceOfOut as val>
					<th class="table__th">${val['server_region']}</th>
				</#list>
			</#if>
          </tr>
          </thead>
          <tbody>
          <tr class="table__tr font-size-14">
			<td class="table__td">下行峰值</td>
			<#if top10RegionXxxServiceOfOut??>
				<#list top10RegionXxxServiceOfOut as val>
					<td class="table__td">${convertNumber(val['ingress_rate_max'],'bps',1000)}</td>
				</#list>
			</#if>
		  </tr>
          <tr class="table__tr font-size-14">
			<td class="table__td">下行均值</td>
			<#if top10RegionXxxServiceOfOut??>
				<#list top10RegionXxxServiceOfOut as val>
					<td class="table__td">${convertNumber(val['ingress_rate_avg'],'bps',1000)}</td>
				</#list>
			</#if>
		  </tr>
          </tbody></table>
      <div class="echarts__title" style="padding-top: 10px;">图9 字节跳动服务对应网段访问域外服务的TOP10省内地区流量分布</div>
  </div>
  

  <div class="header2">三.内容收敛比</div>
  <div class="echarts-box indent-3">
    <div class="echarts">
      <div class="echarts__canvas" id="canvas6" style="width: 550px; height: 280px; display: none;"></div>
      <img height="280" width="550" id="imgCanvas6"/>
      <div class="echarts__title">图10 缓存命中的响应流量占比</div>
    </div>
    <div class="echarts">
      <div class="echarts__canvas" id="canvas7" style="width: 550px; height: 280px; display: none;"></div>
      <img height="280" width="550" id="imgCanvas7"/>
      <div class="echarts__title">图11 缓存命中的会话占比</div>
    </div>
  </div>

</body>
<script>
  /** 数据 begin */
  // 时间区间
  var timeRange = [${startTime}, ${endTime}]
  /* 1.1 流量变化曲线 */
  // sql-1 总流量
  var totalTraffic = ${trafficTotal[0].bytes?eval / 1024}
  // sql-2 字节跳动总流量
  var targetTotalTraffic = ${xxxServiceTrafficTotal[0].bytes?eval / 1024}
  // sql-3 prev字节跳动总流量
  var prevTargetTotalTraffic = ${preXxxServiceTrafficTotal[0].bytes?eval / 1024}
  // sql-4 域外访问字节跳动总流量
  var outToInTotalTraffic = ${outOfXxxServiceTrafficTotal[0].bytes?eval / 1024}
  var outToInEgressTraffic = ${outOfXxxServiceTrafficTotal[0].egress_bytes?eval / 1024}
  var outToInIngressTraffic = ${outOfXxxServiceTrafficTotal[0].ingress_bytes?eval / 1024}
  // sql-5 prev域外访问字节跳动总流量
  var prevOutToInTotalTraffic = ${preOutOfXxxServiceTrafficTotal[0].bytes?eval / 1024}
  // sql-6 字节跳动访问域外总流量
  var inToOutTotalTraffic = ${xxxServiceOfOutTrafficTotal[0].bytes?eval / 1024}
  var inToOutEgressTraffic = ${xxxServiceOfOutTrafficTotal[0].egress_bytes?eval / 1024}
  var inToOutIngressTraffic = ${xxxServiceOfOutTrafficTotal[0].ingress_bytes?eval / 1024}
  // sql-7 prev字节跳动访问域外总流量
  var prevInToOutTotalTraffic = ${preXxxServiceOfOutTrafficTotal[0].bytes?eval / 1024}
  // sql-8
  var quantile1 = {
    rate50: ${xxxServiceRate[0].rate50/1000},
    rate90: ${xxxServiceRate[0].rate90/1000},
    rate99: ${xxxServiceRate[0].rate99/1000},
  }
  // sql-10 流量变化曲线
  var trafficData = [
    <#if xxxServiceTrafficChangingCurve??>
		<#list xxxServiceTrafficChangingCurve as d>
			{stat_time:${d.stat_time?eval * 1000}, rate:${d.rate?eval/1000}},
		</#list>
	</#if>
  ]

  /* 2.1 各省份流量分布 */
  // sql-19 Top 10省份流量分布（域外访问域内）
  var top10ProvinceOutToInTraffic = [
	<#if top10ProvinceOutOfXxxService??>
		<#list top10ProvinceOutOfXxxService as d>	
			{client_province:'${d['client_province']}',egress_bytes:${((d['egress_bytes']?eval)/1024)?string("0.####")},ingress_bytes:${((d['ingress_bytes']?eval)/1024)?string("0.####")},bytes:${((d['bytes']?eval)/1024)?string("0.####")},egress_rate_avg:'${d['egress_rate_avg']}',egress_rate_max:'${d['egress_rate_max']}',egress_rate_min:'${d['egress_rate_min']}',ingress_rate_avg:'${d['ingress_rate_avg']}',ingress_rate_max:'${d['ingress_rate_max']}',ingress_rate_min:'${d['ingress_rate_min']}'},
		</#list>
	</#if>
  ]
  // sql-20
  var prevTop10ProvinceOutToInTraffic = [
    <#if preTop10ProvinceOutOfXxxService??>
		<#list preTop10ProvinceOutOfXxxService as d>	
			{client_province:'${d['client_province']}',egress_bytes:${((d['egress_bytes']?eval)/1024)?string("0.####")},ingress_bytes:${((d['ingress_bytes']?eval)/1024)?string("0.####")},bytes:${((d['bytes']?eval)/1024)?string("0.####")},egress_rate_avg:'${d['egress_rate_avg']}',egress_rate_max:'${d['egress_rate_max']}',egress_rate_min:'${d['egress_rate_min']}',ingress_rate_avg:'${d['ingress_rate_avg']}',ingress_rate_max:'${d['ingress_rate_max']}',ingress_rate_min:'${d['ingress_rate_min']}'},
		</#list>
	</#if>
  ]
  // sql-21 Top 10省份流量分布（域内访问域外）
  var top10ProvinceInToOutTraffic = [
	<#if top10ProvinceXxxServiceOfOut??>
		<#list top10ProvinceXxxServiceOfOut as d>	
			{server_province:'${d['server_province']}',egress_bytes:${((d['egress_bytes']?eval)/1024)?string("0.####")},ingress_bytes:${((d['ingress_bytes']?eval)/1024)?string("0.####")},bytes:${((d['bytes']?eval)/1024)?string("0.####")},egress_rate_avg:'${d['egress_rate_avg']}',egress_rate_max:'${d['egress_rate_max']}',egress_rate_min:'${d['egress_rate_min']}',ingress_rate_avg:'${d['ingress_rate_avg']}',ingress_rate_max:'${d['ingress_rate_max']}',ingress_rate_min:'${d['ingress_rate_min']}'},
		</#list>
	</#if>
  ]
  // sql-22
  var prevTop10ProvinceInToOutTraffic = [
	<#if preTop10ProvinceXxxServiceOfOut??>
		<#list preTop10ProvinceXxxServiceOfOut as d>	
			{server_province:'${d['server_province']}',egress_bytes:${((d['egress_bytes']?eval)/1024)?string("0.####")},ingress_bytes:${((d['ingress_bytes']?eval)/1024)?string("0.####")},bytes:${((d['bytes']?eval)/1024)?string("0.####")},egress_rate_avg:'${d['egress_rate_avg']}',egress_rate_max:'${d['egress_rate_max']}',egress_rate_min:'${d['egress_rate_min']}',ingress_rate_avg:'${d['ingress_rate_avg']}',ingress_rate_max:'${d['ingress_rate_max']}',ingress_rate_min:'${d['ingress_rate_min']}'},
		</#list>
	</#if>
  ]

  /* 2.2 省内各地区流量分布 */
  // sql-23（域外访问域内）
  var top10CityOutToInTraffic = [
	<#if top10RegionOutOfXxxService??>
		<#list top10RegionOutOfXxxService as d>	
			{client_region:'${d['client_region']}',egress_bytes:${((d['egress_bytes']?eval)/1024)?string("0.####")},ingress_bytes:${((d['ingress_bytes']?eval)/1024)?string("0.####")},bytes:${((d['bytes']?eval)/1024)?string("0.####")},egress_rate_avg:'${d['egress_rate_avg']}',egress_rate_max:'${d['egress_rate_max']}',egress_rate_min:'${d['egress_rate_min']}',ingress_rate_avg:'${d['ingress_rate_avg']}',ingress_rate_max:'${d['ingress_rate_max']}',ingress_rate_min:'${d['ingress_rate_min']}'},
		</#list>
	</#if>
  ]
  // sql-24
  var prevTop10CityOutToInTraffic = [
	<#if preTop10OutOfXxxService??>
		<#list preTop10OutOfXxxService as d>	
			{client_region:'${d['client_region']}',egress_bytes:${((d['egress_bytes']?eval)/1024)?string("0.####")},ingress_bytes:${((d['ingress_bytes']?eval)/1024)?string("0.####")},bytes:${((d['bytes']?eval)/1024)?string("0.####")},egress_rate_avg:'${d['egress_rate_avg']}',egress_rate_max:'${d['egress_rate_max']}',egress_rate_min:'${d['egress_rate_min']}',ingress_rate_avg:'${d['ingress_rate_avg']}',ingress_rate_max:'${d['ingress_rate_max']}',ingress_rate_min:'${d['ingress_rate_min']}'},
		</#list>
	</#if>
  ]
  // sql-25（域内访问域外）
  var top10CityInToOutTraffic = [
	<#if top10RegionXxxServiceOfOut??>
		<#list top10RegionXxxServiceOfOut as d>	
			{server_region:'${d['server_region']}',egress_bytes:${((d['egress_bytes']?eval)/1024)?string("0.####")},ingress_bytes:${((d['ingress_bytes']?eval)/1024)?string("0.####")},bytes:${((d['bytes']?eval)/1024)?string("0.####")},egress_rate_avg:'${d['egress_rate_avg']}',egress_rate_max:'${d['egress_rate_max']}',egress_rate_min:'${d['egress_rate_min']}',ingress_rate_avg:'${d['ingress_rate_avg']}',ingress_rate_max:'${d['ingress_rate_max']}',ingress_rate_min:'${d['ingress_rate_min']}'},
		</#list>
	</#if>
  ]
  // sql-26
  var prevTop10CityInToOutTraffic = [
	<#if preTop10RegionXxxServiceOfOut??>
		<#list preTop10RegionXxxServiceOfOut as d>	
			{server_region:'${d['server_region']}',egress_bytes:${((d['egress_bytes']?eval)/1024)?string("0.####")},ingress_bytes:${((d['ingress_bytes']?eval)/1024)?string("0.####")},bytes:${((d['bytes']?eval)/1024)?string("0.####")},egress_rate_avg:'${d['egress_rate_avg']}',egress_rate_max:'${d['egress_rate_max']}',egress_rate_min:'${d['egress_rate_min']}',ingress_rate_avg:'${d['ingress_rate_avg']}',ingress_rate_max:'${d['ingress_rate_max']}',ingress_rate_min:'${d['ingress_rate_min']}'},
		</#list>
	</#if>
  ]

  /* 3. 内容收敛情况 */
  // sql-27 Top3 S2C总流量
  var top3S2cTotalTraffic = [
	<#if xxxServiceTrafficBytes??>
		<#list xxxServiceTrafficBytes as d>	
			{received_bytes:${((d['received_bytes']?eval)/1024)?string("0.####")},server_idc_renter:'${d['server_idc_renter']}',},
		</#list>
	</#if>
  ]
  // sql-28 未命中缓存S2C流量
  var missedCacheS2cTraffic = [
    <#if xxxServiceMissCacheBytes??>
		<#list xxxServiceMissCacheBytes as d>	
			{received_bytes:${((d['received_bytes']?eval)/1024)?string("0.####")},client_idc_renter:'${d['client_idc_renter']}',},
		</#list>
	</#if>
  ]
  // sql-29 Top3 会话总数
  var top3Sessions = [
	<#if xxxServiceTotalSessions??>
		<#list xxxServiceTotalSessions as d>	
			{sessions:${d['sessions']},server_idc_renter:'${d['server_idc_renter']}',},
		</#list>
	</#if>
  ]
  // sql-30 未命中缓存的会话
  var missedCacheSession = [
    <#if xxxServiceMissCacheSessions??>
		<#list xxxServiceMissCacheSessions as d>	
			{sessions:${d['sessions']},client_idc_renter:'${d['client_idc_renter']}',},
		</#list>
	</#if>
  ]
  /** 数据 end */


  /** 内置js begin */
  /* 由于js的number精度最多到8PB-1，而实际流量达百PB级,
    所以对于byte类型数据，在java(freemarker)中除以1024后再处理；时间、数量、百分比等其他类型不变。
  */
  /*var chartColor = ['rgb(83,112,198)', 'rgb(144,204,166)', 'rgb(250,200,88)', 'rgb(238,102,102)',
    'rgb(115,191,222)', 'rgb(59,161,114)', 'rgb(252,132,82)', 'rgb(233,124,204)',
    'rgb(153,96,180)', 'rgb(254,166,158)', 'rgb(87,203,172)', 'rgb(99,182,172)']*/
  var chartColor = ['rgb(132,202,230)', 'rgb(88,176,209)', 'rgb(133,221,214)', 'rgb(245,184,136)',
    'rgb(235,198,90)', 'rgb(237,157,138)', 'rgb(140,206,213)', 'rgb(174,214,222)',
    'rgb(153,96,180)', 'rgb(254,166,158)', 'rgb(87,203,172)', 'rgb(99,182,172)']
  var unitTypes = {
    time: 'time',
    number: 'number',
    byte: 'byte',
    bps: 'bps',
    string: 'string',
    percent: 'percent'
  }

  var numberUnit = ['', 'K', 'M', 'G', 'T', 'P', 'E']
  var byteUnit = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB']
  var bpsUnit = ['bps', 'Kbps', 'Mbps', 'Gbps', 'Tbps', 'Pbps', 'Ebps']
  var timeUnit = [ // 时间单位步进倍数，以ms为基数
    { unit: 'ms', step: 1 },
    { unit: 's', step: 1000 },
    { unit: 'm', step: 60 },
    { unit: 'h', step: 60 },
    { unit: 'd', step: 24 }
  ]
  function asciiCompute (num, offset = 0, ascii = 1000, units, dot = 2) {
    if (!num && num !== 0 && num !== '0') {
      return ['', '']
    }
    num = Number(num)
    var carry = 0
    if (num > 1) {
      var log = Math.log(num) / Math.log(ascii)
      carry = parseInt(log)
      num = num / Math.pow(ascii, carry)
    }
    if (Number.isInteger(num)) {
      return [num, units[carry + offset]]
    } else {
      return [num.toFixed(dot), units[carry + offset]]
    }
  }
  function numberUnitConvert (value, sourceUnit = '', targetUnit, dot = 2) {
    return asciiCompute(value, numberUnit.indexOf(sourceUnit), 1000, numberUnit, dot)
  }
  function byteUnitConvert (value, sourceUnit = 'B', targetUnit, dot = 2) {
    return asciiCompute(value, byteUnit.indexOf(sourceUnit), 1024, byteUnit, dot)
  }
  function bpsUnitConvert (value, sourceUnit = 'bps', targetUnit, dot = 2) {
    return asciiCompute(value, bpsUnit.indexOf(sourceUnit), 1000, bpsUnit, dot)
  }
  function timeUnitFormatter (time, sourceUnit = 'ms', targetUnit, dot = 2) {
    if (time === '' || time instanceof Array || isNaN(time)) {
      return [0, sourceUnit]
    }
    var sourceIndex = -1
    var targetIndex = -1
    timeUnit.forEach((t, i) => {
      sourceUnit === t.unit && (sourceIndex = i)
      targetUnit && targetUnit === t.unit && (targetIndex = i)
    })
    var multi = 1
    var result = parseFloat(time)
    if (targetIndex < 0) {
      while (sourceIndex < timeUnit.length - 1 && result > timeUnit[sourceIndex + 1].step) {
        sourceIndex++
        multi = timeUnit[sourceIndex].step
        result /= multi
      }
      return [multi === 1 ? result : result.toFixed(dot), timeUnit[sourceIndex].unit]
    } else {
      timeUnit.forEach((s, i) => {
        if (i <= targetIndex) {
          multi *= s.step
        }
      })
      result /= multi
      return [result.toFixed(dot), targetUnit]
    }
  }
  function unitConvert (value, unitType, sourceUnit, targetUnit, dot = 2) {
    if (unitType === unitTypes.string) {
      if (value) {
        if (typeof value === 'string') {
          return [value, '']
        } else {
          return ['-', '']
        }
      } else {
        return ['-', '']
      }
    }
    if (!value && value !== 0) {
      return ['-', '']
    } else {
      switch (unitType) {
        case unitTypes.time: {
          return timeUnitFormatter(value, sourceUnit, targetUnit, dot)
        }
        case unitTypes.percent: {
          return [(Number(value) * 100).toFixed(dot), '%']
        }
        case unitTypes.number: {
          return numberUnitConvert(value, sourceUnit, targetUnit, dot)
        }
        case unitTypes.byte: {
          return byteUnitConvert(value, sourceUnit, targetUnit, dot)
        }
        case unitTypes.bps: {
          return bpsUnitConvert(value, sourceUnit, targetUnit, dot)
        }
      }
    }
  }
  function getUnitType (column) {
    if (column) {
      switch (column.toLowerCase()) {
        case 'time': {
          return unitTypes.time
        }
        case 'bytes': {
          return unitTypes.byte
        }
        case 'sessions':
        default: {
          return unitTypes.number
        }
      }
    } else {
      return unitTypes.number
    }
  }
  function valueToRangeValue (value, unitType) {
    var values = unitConvert(value, unitType)
    if (values[0] || values[0] === 0) {
      switch (unitType) {
        case unitTypes.time: {
          if (values[0] < 1) {
            return ['<1', 'ms']
          }
          break
        }
        case unitTypes.percent: {
          if (values[0] < 0.01) {
            return ['<0.01', '%']
          }
          break
        }
        default: break
      }
    }
    return values
  }
  // 十位数的时间戳
  function timestampToStr (timestamp) {
    var time = new Date(timestamp * 1000)
    var year = time.getFullYear(),
    month = time.getMonth() + 1 ,  //月份是从0开始的
    day = time.getDate(),
    hour = time.getHours(),
    minute = time.getMinutes(),
    second = time.getSeconds()
    return  year + '-' + add0(month) + '-' + add0(day) + ' ' + add0(hour) + ':' + add0(minute)
  }
  function add0 (m) {
    return m < 10 ? '0' + m: m
  }
  function isWholeDay (_timeRange) {
    var _timeRangeStrStart = timestampToStr(_timeRange[0])
    var _timeOffset = _timeRange[1] - _timeRange[0]
    return (_timeOffset === 86400 || _timeOffset === 86399) && _timeRangeStrStart.indexOf('00:00') > -1
  }
  /** 内置js end */


  // 计算出前三个周期的时间戳范围
  var timeOffset = timeRange[1] - timeRange[0]
  var wholeTimeOffset = [60 * 60 - 1, 60 * 60 * 24 - 1, 60 * 60 * 24 * 7 - 1]
  if (wholeTimeOffset.indexOf(timeOffset) > -1) {
    timeOffset++
  }
  var prevTimeRange = [timeRange[0] - timeOffset, timeRange[1] - timeOffset]
  var pprevTimeRange = [prevTimeRange[0] - timeOffset, prevTimeRange[1] - timeOffset]
  var ppprevTimeRange = [pprevTimeRange[0] - timeOffset, pprevTimeRange[1] - timeOffset]
  // 填充时间
  function initTimeRange () {
    var currentRange0 = document.getElementById('currentRange0')
    var currentRangeStr = ''
    var prevRangeStr = ''
    if (isWholeDay(timeRange)) {
      currentRangeStr = timestampToStr(timeRange[0]).substring(0, 10)
      prevRangeStr = timestampToStr(prevTimeRange[0]).substring(0, 10)
    } else {
      currentRangeStr = timestampToStr(timeRange[0]) + ' -- ' + timestampToStr(timeRange[1])
      prevRangeStr = timestampToStr(prevTimeRange[0]) + ' -- ' + timestampToStr(prevTimeRange[1])
    }
    currentRange0.innerText = currentRangeStr
  }

  var seriesData1 = trafficData.map(d => [d.stat_time, d.rate])
  var unit1 = 'Kbps'
  function initEcharts1 () {
    var myChart = echarts.init(document.getElementById('canvas1'))
    var option = {
      color: chartColor,
      animation: false,
      grid: {
        left: 100,
        right: 120,
        bottom: 25,
        top: 40
      },
      xAxis: {
        type: 'time',
        maxInterval: 3600000,
        axisLabel: {
          formatter: '{HH}:{mm}'
        }
      },
      yAxis: {
        splitLine: { show: false },
        offset: 10,
        axisLabel: {
          formatter (params) {
            return unitConvert(params, unitTypes.bps, unit1).join(' ')
          }
        }
      },
      visualMap: {
        show: false,
        pieces: [
          {
            gt: 0,
            lte: quantile1.rate50,
            color: 'rgb(251,219,15)'
          },
          {
            gt: quantile1.rate50,
            lte: quantile1.rate90,
            color: 'rgb(252,125,2)'
          },
          {
            gt: quantile1.rate90,
            lte: quantile1.rate99,
            color: 'rgb(253,1,0)'
          },
          {
            gt: quantile1.rate99,
            color: 'rgb(170,6,159)'
          }
        ],
        outOfRange: {
          color: 'rgb(153,153,153)'
        }
      },
      series: {
        type: 'line',
        symbol: 'none',
        data: seriesData1,
        markLine: {
          silent: true,
          lineStyle: {
            color: 'rgb(153,153,153)'
          },
          symbol: 'none',
          label: {
            formatter (params) {
              var arr = unitConvert(params.value, unitTypes.bps, unit1).join(' ')
              var desc = ''
              switch (params.dataIndex) {
                case 0: {
                  desc = 'P50'
                  break
                }
                case 1: {
                  desc = 'P90'
                  break
                }
                case 2: {
                  desc = 'P99'
                  break
                }
                default: break
              }
              return arr + ' (' + desc + ')'
            }
          },
          data: [
            {
              yAxis: quantile1.rate50
            },
            {
              yAxis: quantile1.rate90
            },
            {
              yAxis: quantile1.rate99
            }
          ]
        }
      }
    }
    myChart.setOption(option)
    document.getElementById('imgCanvas1').src = myChart.getDataURL({pixelRatio: 1})
  }

  //  域外访问域内服务的Top 10省份流量分布折线图
  var unit2 = 'KB'
  var categoryData2 = top10ProvinceOutToInTraffic.map(t => t.client_province)
  var barSeriesDataUp2 = top10ProvinceOutToInTraffic.map(t => ({ value: t.egress_bytes, percent: outToInEgressTraffic === 0 ? 0 : parseFloat(t.egress_bytes) / outToInEgressTraffic }))
  var lineSeriesDataUp2 = top10ProvinceOutToInTraffic.map(t => {
    var findData = prevTop10ProvinceOutToInTraffic.find(pt => pt.client_province === t.client_province)
    if (findData) {
      return findData.egress_bytes === 0 ? 0 : parseFloat(((t.egress_bytes - findData.egress_bytes) / parseFloat(findData.egress_bytes) * 100).toFixed(2))
    } else {
      return 0
    }
  })
  var copyLineSeriesData2 = [...lineSeriesDataUp2]
  var copyBarSeriesData2 = [...barSeriesDataUp2]
  copyLineSeriesData2.sort((a, b) => a - b)
  copyBarSeriesData2.sort((a, b) => a.value - b.value)
  var barMax2 = copyBarSeriesData2.length > 0 ? copyBarSeriesData2[copyBarSeriesData2.length - 1].value : 50
  var lineMin2 = copyLineSeriesData2[0] ? copyLineSeriesData2[0] : 0
  var lineMax2 = copyLineSeriesData2.length > 0 ? copyLineSeriesData2[copyLineSeriesData2.length - 1] : 0
  if (lineMin2 == 0 && lineMin2 == lineMax2) {
    lineMin2 = -5
    lineMax2 = 1
  } else {
    var tempLineMin2 = lineMin2
    lineMin2 = lineMin2 - 2.5 * (lineMax2 - lineMin2)
    lineMax2 = lineMax2 + 0.5 * (lineMax2 - tempLineMin2)
  }
  function initEcharts2 () {
    var myChart = echarts.init(document.getElementById('canvas2'))
    var option = {
      animation: false,
      grid: {
        top: 50,
        bottom: 25,
        right: 40,
        left: 70
      },
      legend: {
        show: true,
        top: 'top',
        left: 'left'
      },
      xAxis: {
        type: 'category',
        data: categoryData2,
        axisLabel: {
          interval: 0,
          fontSize: 12
        }
      },
      yAxis: [
        {
          name: '流量',
          max: barMax2 * 2,
          nameTextStyle: {
            color: 'transparent'
          },
          type: 'value',
          axisLabel: {
            formatter (value) {
              return unitConvert(value, unitTypes.byte, unit2).join('')
            }
          }
        },
        {
          show: false,
          name: '环比',
          type: 'value',
          min: lineMin2,
          max: lineMax2
        }
      ],
      series: [
        {
          name: '上行流量',
          data: barSeriesDataUp2,
          barMinHeight: 5,
          type: 'bar',
          barWidth: 40,
          label: {
            show: true,
            formatter: function (param) {
              return unitConvert(param.value, unitTypes.byte, unit2).join('') + '\n' + unitConvert(param.data.percent, unitTypes.percent).join('')
            },
            distance: 3,
            color: 'rgb(59,162,201)',
            textBorderColor: 'white',
            textBorderWidth: 3,
            position: 'top',
            fontSize: 10
          },
          itemStyle: {
            color: 'rgb(59,162,201)'
          }
        },
        {
          yAxisIndex: 1,
          name: '上行流量环比',
          data: lineSeriesDataUp2,
          type: 'line',
          label: {
            show: true,
            formatter: function (param) {
              return param.value.toFixed(2) + '%'
            },
            textBorderColor: 'white',
            textBorderWidth: 3,
            color: 'rgb(59,162,201)'
          },
          lineStyle: {
            type: 'dashed'
          },
          itemStyle: {
            color: 'rgb(59,162,201)'
          }
        }
      ]
    }
    myChart.setOption(option)
    document.getElementById('imgCanvas2').src = myChart.getDataURL({pixelRatio: 1})
  }

  //  域外访问域内服务的Top 10省份流量分布折线图
  var unit8 = 'KB'
  var categoryData8 = top10ProvinceOutToInTraffic.map(t => t.client_province)
  var barSeriesDataDown8 = top10ProvinceOutToInTraffic.map(t => ({ value: t.ingress_bytes, percent: outToInIngressTraffic === 0 ? 0 : parseFloat(t.ingress_bytes) / outToInIngressTraffic }))
  var lineSeriesDataDown8 = top10ProvinceOutToInTraffic.map(t => {
    var findData = prevTop10ProvinceOutToInTraffic.find(pt => pt.client_province === t.client_province)
    if (findData) {
      return findData.ingress_bytes === 0 ? 0.00 : parseFloat(((t.ingress_bytes - findData.ingress_bytes) / parseFloat(findData.ingress_bytes) * 100).toFixed(2))
    } else {
      return 0
    }
  })
  var copyLineSeriesData8 = [...lineSeriesDataDown8]
  var copyBarSeriesData8 = [...barSeriesDataDown8]
  copyLineSeriesData8.sort((a, b) => a - b)
  copyBarSeriesData8.sort((a, b) => a.value - b.value)
  var barMax8 = copyBarSeriesData8.length > 0 ? copyBarSeriesData8[copyBarSeriesData8.length - 1].value : 50
  var lineMin8 = copyLineSeriesData8[0] ? copyLineSeriesData8[0] : 0
  var lineMax8 = copyLineSeriesData8.length > 0 ? copyLineSeriesData8[copyLineSeriesData8.length - 1] : 0
  if (lineMin8 == 0 && lineMin8 == lineMax8) {
    lineMin8 = -5
    lineMax8 = 1
  } else {
    var tempLineMin8 = lineMin8
    lineMin8 = lineMin8 - 2.5 * (lineMax8 - lineMin8)
    lineMax8 = lineMax8 + 0.5 * (lineMax8 - tempLineMin8)
  }
  function initEcharts8 () {
    var myChart = echarts.init(document.getElementById('canvas8'))
    var option = {
      animation: false,
      grid: {
        top: 50,
        bottom: 25,
        right: 40,
        left: 70
      },
      legend: {
        show: true,
        top: 'top',
        left: 'left'
      },
      xAxis: {
        type: 'category',
        data: categoryData8,
        axisLabel: {
          interval: 0,
          fontSize: 12
        }
      },
      yAxis: [
        {
          name: '流量',
          max: barMax8 * 2,
          nameTextStyle: {
            color: 'transparent'
          },
          type: 'value',
          axisLabel: {
            formatter (value) {
              return unitConvert(value, unitTypes.byte, unit8).join('')
            }
          }
        },
        {
          show: false,
          name: '环比',
          type: 'value',
          min: lineMin8,
          max: lineMax8
        }
      ],
      series: [
        {
          name: '下行流量',
          data: barSeriesDataDown8,
          barMinHeight: 5,
          type: 'bar',
          barWidth: 40,
          label: {
            show: true,
            formatter: function (param) {
              return unitConvert(param.value, unitTypes.byte, unit8).join('') + '\n' + unitConvert(param.data.percent, unitTypes.percent).join('')
            },
            distance: 3,
            color: chartColor[2],
            textBorderColor: 'white',
            textBorderWidth: 3,
            position: 'top',
            fontSize: 10
          },
          itemStyle: {
            color: chartColor[2]
          }
        },
        {
          yAxisIndex: 1,
          name: '下行流量环比',
          data: lineSeriesDataDown8,
          type: 'line',
          label: {
            show: true,
            formatter: function (param) {
              return param.value.toFixed(2) + '%'
            },
            textBorderColor: 'white',
            textBorderWidth: 3,
            color: chartColor[2]
          },
          lineStyle: {
            type: 'dashed'
          },
          itemStyle: {
            color: chartColor[2]
          }
        }
      ]
    }
    myChart.setOption(option)
    document.getElementById('imgCanvas8').src = myChart.getDataURL({pixelRatio: 1})
  }

  //  域内访问域外服务的Top 10省份流量分布折线图
  var unit3 = 'KB'
  var categoryData3 = top10ProvinceInToOutTraffic.map(t => t.server_province)
  var barSeriesDataUp3 = top10ProvinceInToOutTraffic.map(t => ({ value: t.egress_bytes, percent: inToOutEgressTraffic === 0 ? 0 : parseFloat(t.egress_bytes) / inToOutEgressTraffic }))
  var lineSeriesDataUp3 = top10ProvinceInToOutTraffic.map(t => {
    var findData = prevTop10ProvinceInToOutTraffic.find(pt => pt.server_province === t.server_province)
    if (findData) {
      return findData.egress_bytes === 0 ? 0 : parseFloat(((t.egress_bytes - findData.egress_bytes) / parseFloat(findData.egress_bytes) * 100).toFixed(2))
    } else {
      return 0
    }
  })
  var copyLineSeriesData3 = [...lineSeriesDataUp3]
  var copyBarSeriesData3 = [...barSeriesDataUp3]
  copyLineSeriesData3.sort((a, b) => a - b)
  copyBarSeriesData3.sort((a, b) => a.value - b.value)
  var barMax3 = copyBarSeriesData3.length > 0 ? copyBarSeriesData3[copyBarSeriesData3.length - 1].value : 50
  var lineMin3 = copyLineSeriesData3[0] ? copyLineSeriesData3[0] : 0
  var lineMax3 = copyLineSeriesData3.length > 0 ? copyLineSeriesData3[copyLineSeriesData3.length - 1] : 0
  if (lineMin3 == 0 && lineMin3 == lineMax3) {
    lineMin3 = -5
    lineMax3 = 1
  } else {
    var tempLineMin3 = lineMin3
    lineMin3 = lineMin3 - 2.5 * (lineMax3 - lineMin3)
    lineMax3 = lineMax3 + 0.5 * (lineMax3 - tempLineMin3)
  }
  function initEcharts3 () {
    var myChart = echarts.init(document.getElementById('canvas3'))
    var option = {
      animation: false,
      grid: {
        top: 50,
        bottom: 25,
        right: 40,
        left: 70
      },
      legend: {
        show: true,
        top: 'top',
        left: 'left'
      },
      xAxis: {
        type: 'category',
        data: categoryData3,
        axisLabel: {
          interval: 0,
          fontSize: 12
        }
      },
      yAxis: [
        {
          name: '流量',
          max: barMax3 * 2,
          nameTextStyle: {
            color: 'transparent'
          },
          type: 'value',
          axisLabel: {
            formatter (value) {
              return unitConvert(value, unitTypes.byte, unit3).join('')
            }
          }
        },
        {
          show: false,
          name: '环比',
          type: 'value',
          min: lineMin3,
          max: lineMax3
        }
      ],
      series: [
        {
          name: '上行流量',
          data: barSeriesDataUp3,
          barMinHeight: 5,
          type: 'bar',
          barWidth: 40,
          label: {
            show: true,
            formatter: function (param) {
              return unitConvert(param.value, unitTypes.byte, unit3).join('') + '\n' + unitConvert(param.data.percent, unitTypes.percent).join('')
            },
            distance: 3,
            color: 'rgb(59,162,201)',
            textBorderColor: 'white',
            textBorderWidth: 3,
            position: 'top',
            fontSize: 10
          },
          itemStyle: {
            color: 'rgb(59,162,201)'
          }
        },
        {
          yAxisIndex: 1,
          name: '上行流量环比',
          data: lineSeriesDataUp3,
          type: 'line',
          label: {
            show: true,
            formatter: function (param) {
              return param.value.toFixed(2) + '%'
            },
            textBorderColor: 'white',
            textBorderWidth: 3,
            color: 'rgb(59,162,201)'
          },
          lineStyle: {
            type: 'dashed'
          },
          itemStyle: {
            color: 'rgb(59,162,201)'
          }
        }
      ]
    }
    myChart.setOption(option)
    document.getElementById('imgCanvas3').src = myChart.getDataURL({pixelRatio: 1})
  }

  //  域内访问域外服务的Top 10省份流量分布折线图
  var unit9 = 'KB'
  var categoryData9 = top10ProvinceInToOutTraffic.map(t => t.server_province)
  var barSeriesDataDown9 = top10ProvinceInToOutTraffic.map(t => ({ value: t.ingress_bytes, percent: inToOutIngressTraffic === 0 ? 0 : parseFloat(t.ingress_bytes) / inToOutIngressTraffic }))
  var lineSeriesDataDown9 = top10ProvinceInToOutTraffic.map(t => {
    var findData = prevTop10ProvinceInToOutTraffic.find(pt => pt.server_province === t.server_province)
    if (findData) {
      return findData.ingress_bytes === 0 ? 0.00 : parseFloat(((t.ingress_bytes - findData.ingress_bytes) / parseFloat(findData.ingress_bytes) * 100).toFixed(2))
    } else {
      return 0
    }
  })
  var copyLineSeriesData9 = [...lineSeriesDataDown9]
  var copyBarSeriesData9 = [...barSeriesDataDown9]
  copyLineSeriesData9.sort((a, b) => a - b)
  copyBarSeriesData9.sort((a, b) => a.value - b.value)
  var barMax9 = copyBarSeriesData9.length > 0 ? copyBarSeriesData9[copyBarSeriesData9.length - 1].value : 50
  var lineMin9 = copyLineSeriesData9[0] ? copyLineSeriesData9[0] : 0
  var lineMax9 = copyLineSeriesData9.length > 0 ? copyLineSeriesData9[copyLineSeriesData9.length - 1] : 0
  if (lineMin9 == 0 && lineMin9 == lineMax9) {
    lineMin9 = -5
    lineMax9 = 1
  } else {
    var tempLineMin9 = lineMin9
    lineMin9 = lineMin9 - 2.5 * (lineMax9 - lineMin9)
    lineMax9 = lineMax9 + 0.5 * (lineMax9 - tempLineMin9)
  }
  function initEcharts9 () {
    var myChart = echarts.init(document.getElementById('canvas9'))
    var option = {
      animation: false,
      grid: {
        top: 50,
        bottom: 25,
        right: 40,
        left: 70
      },
      legend: {
        show: true,
        top: 'top',
        left: 'left'
      },
      xAxis: {
        type: 'category',
        data: categoryData9,
        axisLabel: {
          interval: 0,
          fontSize: 12
        }
      },
      yAxis: [
        {
          name: '流量',
          max: barMax9 * 2,
          nameTextStyle: {
            color: 'transparent'
          },
          type: 'value',
          axisLabel: {
            formatter (value) {
              return unitConvert(value, unitTypes.byte, unit9).join('')
            }
          }
        },
        {
          show: false,
          name: '环比',
          type: 'value',
          min: lineMin9,
          max: lineMax9
        }
      ],
      series: [
        {
          name: '下行流量',
          data: barSeriesDataDown9,
          barMinHeight: 5,
          type: 'bar',
          barWidth: 40,
          label: {
            show: true,
            formatter: function (param) {
              return unitConvert(param.value, unitTypes.byte, unit9).join('') + '\n' + unitConvert(param.data.percent, unitTypes.percent).join('')
            },
            distance: 3,
            color: chartColor[2],
            textBorderColor: 'white',
            textBorderWidth: 3,
            position: 'top',
            fontSize: 10
          },
          itemStyle: {
            color: chartColor[2]
          }
        },
        {
          yAxisIndex: 1,
          name: '下行流量环比',
          data: lineSeriesDataDown9,
          type: 'line',
          label: {
            show: true,
            formatter: function (param) {
              return param.value.toFixed(2) + '%'
            },
            textBorderColor: 'white',
            textBorderWidth: 3,
            color: chartColor[2]
          },
          lineStyle: {
            type: 'dashed'
          },
          itemStyle: {
            color: chartColor[2]
          }
        }
      ]
    }
    myChart.setOption(option)
    document.getElementById('imgCanvas9').src = myChart.getDataURL({pixelRatio: 1})
  }

  // 域外访问域内服务的Top 10省内地区流量分布折线图
  var unit4 = 'KB'
  var categoryData4 = top10CityOutToInTraffic.map(t => t.client_region)
  var barSeriesDataUp4 = top10CityOutToInTraffic.map(t => ({ value: t.egress_bytes, percent: outToInEgressTraffic === 0 ? 0 : parseFloat(t.egress_bytes) / outToInEgressTraffic }))
  var lineSeriesDataUp4 = top10CityOutToInTraffic.map(t => {
    var findData = prevTop10CityOutToInTraffic.find(pt => pt.client_region === t.client_region)
    if (findData) {
      return findData.egress_bytes === 0 ? 0 : parseFloat(((t.egress_bytes - findData.egress_bytes) / parseFloat(findData.egress_bytes) * 100).toFixed(2))
    } else {
      return 0
    }
  })
  var copyLineSeriesData4 = [...lineSeriesDataUp4]
  var copyBarSeriesData4 = [...barSeriesDataUp4]
  copyLineSeriesData4.sort((a, b) => a - b)
  copyBarSeriesData4.sort((a, b) => a.value - b.value)
  var barMax4 = copyBarSeriesData4.length > 0 ? copyBarSeriesData4[copyBarSeriesData4.length - 1].value : 50
  var lineMin4 = copyLineSeriesData4[0] ? copyLineSeriesData4[0] : 0
  var lineMax4 = copyLineSeriesData4.length > 0 ? copyLineSeriesData4[copyLineSeriesData4.length - 1] : 0
  if (lineMin4 == 0 && lineMin4 == lineMax4) {
    lineMin4 = -5
    lineMax4 = 1
  } else {
    var tempLineMin4 = lineMin4
    lineMin4 = lineMin4 - 2.5 * (lineMax4 - lineMin4)
    lineMax4 = lineMax4 + 0.5 * (lineMax4 - tempLineMin4)
  }
  function initEcharts4 () {
    var myChart = echarts.init(document.getElementById('canvas4'))
    var option = {
      animation: false,
      grid: {
        top: 50,
        bottom: 25,
        right: 40,
        left: 70
      },
      legend: {
        show: true,
        top: 'top',
        left: 'left'
      },
      xAxis: {
        type: 'category',
        data: categoryData4,
        axisLabel: {
          interval: 0,
          fontSize: 12
        }
      },
      yAxis: [
        {
          name: '流量',
          max: barMax4 * 2,
          nameTextStyle: {
            color: 'transparent'
          },
          type: 'value',
          axisLabel: {
            formatter (value) {
              return unitConvert(value, unitTypes.byte, unit4).join('')
            }
          }
        },
        {
          show: false,
          name: '环比',
          type: 'value',
          min: lineMin4,
          max: lineMax4
        }
      ],
      series: [
        {
          name: '上行流量',
          barMinHeight: 5,
          data: barSeriesDataUp4,
          type: 'bar',
          barWidth: 40,
          label: {
            show: true,
            formatter: function (param) {
              return unitConvert(param.value, unitTypes.byte, unit4).join('') + '\n' + unitConvert(param.data.percent, unitTypes.percent).join('')
            },
            color: 'rgb(59,162,201)',
            textBorderColor: 'white',
            textBorderWidth: 3,
            position: 'top',
            fontSize: 10
          },
          itemStyle: {
            color: 'rgb(59,162,201)'
          }
        },
        {
          yAxisIndex: 1,
          name: '上行流量环比',
          data: lineSeriesDataUp4,
          type: 'line',
          label: {
            show: true,
            formatter: function (param) {
              return param.value.toFixed(2) + '%'
            },
            textBorderColor: 'white',
            textBorderWidth: 3,
            color: 'rgb(59,162,201)'
          },
          lineStyle: {
            type: 'dashed'
          },
          itemStyle: {
            color: 'rgb(59,162,201)'
          }
        }
      ]
    }
    myChart.setOption(option)
    document.getElementById('imgCanvas4').src = myChart.getDataURL({pixelRatio: 1})
  }

  // 域外访问域内服务的Top 10省内地区流量分布折线图
  var unit10 = 'KB'
  var categoryData10 = top10CityOutToInTraffic.map(t => t.client_region)
  var barSeriesDataDown10 = top10CityOutToInTraffic.map(t => ({ value: t.ingress_bytes, percent: outToInIngressTraffic === 0 ? 0 : parseFloat(t.ingress_bytes) / outToInIngressTraffic }))
  var lineSeriesDataDown10 = top10CityOutToInTraffic.map(t => {
    var findData = prevTop10CityOutToInTraffic.find(pt => pt.client_region === t.client_region)
    if (findData) {
      return findData.ingress_bytes === 0 ? 0 : parseFloat(((t.ingress_bytes - findData.ingress_bytes) / parseFloat(findData.ingress_bytes) * 100).toFixed(2))
    } else {
      return 0
    }
  })
  var copyLineSeriesData10 = [...lineSeriesDataDown10]
  var copyBarSeriesData10 = [...barSeriesDataDown10]
  copyLineSeriesData10.sort((a, b) => a - b)
  copyBarSeriesData10.sort((a, b) => a.value - b.value)
  var barMax10 = copyBarSeriesData10.length > 0 ? copyBarSeriesData10[copyBarSeriesData10.length - 1].value : 50
  var lineMin10 = copyLineSeriesData10[0] ? copyLineSeriesData10[0] : 0
  var lineMax10 = copyLineSeriesData10.length > 0 ? copyLineSeriesData10[copyLineSeriesData10.length - 1] : 0
  if (lineMin10 == 0 && lineMin10 == lineMax10) {
    lineMin10 = -5
    lineMax10 = 1
  } else {
    var tempLineMin10 = lineMin10
    lineMin10 = lineMin10 - 2.5 * (lineMax10 - lineMin10)
    lineMax10 = lineMax10 + 0.5 * (lineMax10 - tempLineMin10)
  }
  function initEcharts10 () {
    var myChart = echarts.init(document.getElementById('canvas10'))
    var option = {
      animation: false,
      grid: {
        top: 50,
        bottom: 25,
        right: 40,
        left: 70
      },
      legend: {
        show: true,
        top: 'top',
        left: 'left'
      },
      xAxis: {
        type: 'category',
        data: categoryData10,
        axisLabel: {
          interval: 0,
          fontSize: 12
        }
      },
      yAxis: [
        {
          name: '流量',
          max: barMax10 * 2,
          nameTextStyle: {
            color: 'transparent'
          },
          type: 'value',
          axisLabel: {
            formatter (value) {
              return unitConvert(value, unitTypes.byte, unit10).join('')
            }
          }
        },
        {
          show: false,
          name: '环比',
          type: 'value',
          min: lineMin10,
          max: lineMax10
        }
      ],
      series: [
        {
          name: '下行流量',
          barMinHeight: 5,
          data: barSeriesDataDown10,
          type: 'bar',
          barWidth: 40,
          label: {
            show: true,
            formatter: function (param) {
              return unitConvert(param.value, unitTypes.byte, unit10).join('') + '\n' + unitConvert(param.data.percent, unitTypes.percent).join('')
            },
            color: chartColor[2],
            textBorderColor: 'white',
            textBorderWidth: 3,
            position: 'top',
            fontSize: 10
          },
          itemStyle: {
            color: chartColor[2]
          }
        },
        {
          yAxisIndex: 1,
          name: '下行流量环比',
          data: lineSeriesDataDown10,
          type: 'line',
          label: {
            show: true,
            formatter: function (param) {
              return param.value.toFixed(2) + '%'
            },
            textBorderColor: 'white',
            textBorderWidth: 3,
            color: chartColor[2]
          },
          lineStyle: {
            type: 'dashed'
          },
          itemStyle: {
            color: chartColor[2]
          }
        }
      ]
    }
    myChart.setOption(option)
    document.getElementById('imgCanvas10').src = myChart.getDataURL({pixelRatio: 1})
  }

  // 域内访问域外服务的TOP 10省内地区流量分布折线图
  var unit5 = 'KB'
  var categoryData5 = top10CityInToOutTraffic.map(t => t.server_region)
  var barSeriesDataUp5 = top10CityInToOutTraffic.map(t => ({ value: t.egress_bytes, percent: inToOutEgressTraffic === 0 ? 0 : parseFloat(t.egress_bytes) / inToOutEgressTraffic }))
  var lineSeriesDataUp5 = top10CityInToOutTraffic.map(t => {
    var findData = prevTop10CityInToOutTraffic.find(pt => pt.server_region === t.server_region)
    if (findData) {
      return findData.egress_bytes === 0 ? 0 : parseFloat(((t.egress_bytes - findData.egress_bytes) / parseFloat(findData.egress_bytes) * 100).toFixed(2))
    } else {
      return 0
    }
  })
  var copyLineSeriesData5 = [...lineSeriesDataUp5]
  var copyBarSeriesData5 = [...barSeriesDataUp5]
  copyLineSeriesData5.sort((a, b) => a - b)
  copyBarSeriesData5.sort((a, b) => a.value - b.value)
  var barMax5 = copyBarSeriesData5.length > 0 ? copyBarSeriesData5[copyBarSeriesData5.length - 1].value : 50
  var lineMin5 = copyLineSeriesData5[0] ? copyLineSeriesData5[0] : 0
  var lineMax5 = copyLineSeriesData5.length > 0 ? copyLineSeriesData5[copyLineSeriesData5.length - 1] : 0
  if (lineMin5 == 0 && lineMin5 == lineMax5) {
    lineMin5 = -5
    lineMax5 = 1
  } else {
    var tempLineMin5 = lineMin5
    lineMin5 = lineMin5 - 2.5 * (lineMax5 - lineMin5)
    lineMax5 = lineMax5 + 0.5 * (lineMax5 - tempLineMin5)
  }
  function initEcharts5 () {
    var myChart = echarts.init(document.getElementById('canvas5'))
    var option = {
      animation: false,
      grid: {
        top: 50,
        bottom: 25,
        right: 40,
        left: 70
      },
      legend: {
        show: true,
        top: 'top',
        left: 'left'
      },
      xAxis: {
        type: 'category',
        data: categoryData5,
        axisLabel: {
          interval: 0,
          fontSize: 12
        }
      },
      yAxis: [
        {
          name: '流量',
          max: barMax5 * 2,
          nameTextStyle: {
            color: 'transparent'
          },
          type: 'value',
          axisLabel: {
            formatter (value) {
              return unitConvert(value, unitTypes.byte, unit5).join('')
            }
          }
        },
        {
          show: false,
          name: '环比',
          type: 'value',
          min: lineMin5,
          max: lineMax5
        }
      ],
      series: [
        {
          name: '上行流量',
          barMinHeight: 5,
          data: barSeriesDataUp5,
          type: 'bar',
          barWidth: 40,
          label: {
            show: true,
            formatter: function (param) {
              return unitConvert(param.value, unitTypes.byte, unit5).join('') + '\n' + unitConvert(param.data.percent, unitTypes.percent).join('')
            },
            color: 'rgb(59,162,201)',
            textBorderColor: 'white',
            textBorderWidth: 3,
            position: 'top',
            fontSize: 10
          },
          itemStyle: {
            color: 'rgb(59,162,201)'
          }
        },
        {
          yAxisIndex: 1,
          name: '上行流量环比',
          data: lineSeriesDataUp5,
          type: 'line',
          label: {
            show: true,
            formatter: function (param) {
              return param.value.toFixed(2) + '%'
            },
            textBorderColor: 'white',
            textBorderWidth: 3,
            color: 'rgb(59,162,201)'
          },
          lineStyle: {
            type: 'dashed'
          },
          itemStyle: {
            color: 'rgb(59,162,201)'
          }
        }
      ]
    }
    myChart.setOption(option)
    document.getElementById('imgCanvas5').src = myChart.getDataURL({pixelRatio: 1})
  }

  // 域内访问域外服务的TOP 10省内地区流量分布折线图
  var unit11 = 'KB'
  var categoryData11 = top10CityInToOutTraffic.map(t => t.server_region)
  var barSeriesDataDown11 = top10CityInToOutTraffic.map(t => ({ value: t.ingress_bytes, percent: inToOutIngressTraffic === 0 ? 0 : parseFloat(t.ingress_bytes) / inToOutIngressTraffic }))
  var lineSeriesDataDown11 = top10CityInToOutTraffic.map(t => {
    var findData = prevTop10CityInToOutTraffic.find(pt => pt.server_region === t.server_region)
    if (findData) {
      return findData.ingress_bytes === 0 ? 0 : parseFloat(((t.ingress_bytes - findData.ingress_bytes) / parseFloat(findData.ingress_bytes) * 100).toFixed(2))
    } else {
      return 0
    }
  })
  var copyLineSeriesData11 = [...lineSeriesDataDown11]
  var copyBarSeriesData11 = [...barSeriesDataDown11]
  copyLineSeriesData11.sort((a, b) => a - b)
  copyBarSeriesData11.sort((a, b) => a.value - b.value)
  var barMax11 = copyBarSeriesData11.length > 0 ? copyBarSeriesData11[copyBarSeriesData11.length - 1].value : 50
  var lineMin11 = copyLineSeriesData11[0] ? copyLineSeriesData11[0] : 0
  var lineMax11 = copyLineSeriesData11.length > 0 ? copyLineSeriesData11[copyLineSeriesData11.length - 1] : 0
  if (lineMin11 == 0 && lineMin11 == lineMax11) {
    lineMin11 = -5
    lineMax11 = 1
  } else {
    var tempLineMin11 = lineMin11
    lineMin11 = lineMin11 - 2.5 * (lineMax11 - lineMin11)
    lineMax11 = lineMax11 + 0.5 * (lineMax11 - tempLineMin11)
  }
  function initEcharts11 () {
    var myChart = echarts.init(document.getElementById('canvas11'))
    var option = {
      animation: false,
      grid: {
        top: 50,
        bottom: 25,
        right: 40,
        left: 70
      },
      legend: {
        show: true,
        top: 'top',
        left: 'left'
      },
      xAxis: {
        type: 'category',
        data: categoryData11,
        axisLabel: {
          interval: 0,
          fontSize: 12
        }
      },
      yAxis: [
        {
          name: '流量',
          max: barMax11 * 2,
          nameTextStyle: {
            color: 'transparent'
          },
          type: 'value',
          axisLabel: {
            formatter (value) {
              return unitConvert(value, unitTypes.byte, unit11).join('')
            }
          }
        },
        {
          show: false,
          name: '环比',
          type: 'value',
          min: lineMin11,
          max: lineMax11
        }
      ],
      series: [
        {
          name: '下行流量',
          barMinHeight: 5,
          data: barSeriesDataDown11,
          type: 'bar',
          barWidth: 40,
          label: {
            show: true,
            formatter: function (param) {
              return unitConvert(param.value, unitTypes.byte, unit11).join('') + '\n' + unitConvert(param.data.percent, unitTypes.percent).join('')
            },
            color: chartColor[2],
            textBorderColor: 'white',
            textBorderWidth: 3,
            position: 'top',
            fontSize: 10
          },
          itemStyle: {
            color: chartColor[2]
          }
        },
        {
          yAxisIndex: 1,
          name: '下行流量环比',
          data: lineSeriesDataDown11,
          type: 'line',
          label: {
            show: true,
            formatter: function (param) {
              return param.value.toFixed(2) + '%'
            },
            textBorderColor: 'white',
            textBorderWidth: 3,
            color: chartColor[2]
          },
          lineStyle: {
            type: 'dashed'
          },
          itemStyle: {
            color: chartColor[2]
          }
        }
      ]
    }
    myChart.setOption(option)
    document.getElementById('imgCanvas11').src = myChart.getDataURL({pixelRatio: 1})
  }

  var total6 = top3S2cTotalTraffic[0]
  var seriesData6 = []
  var startAngle6 = 90
  if (total6) {
    var missedCache6 = missedCacheS2cTraffic.find(t => total6.server_idc_renter ===  t.client_idc_renter)
    if (missedCache6) {
      seriesData6.push({ name: '缓存未命中流量', value: missedCache6.received_bytes })
      seriesData6.push({ name: '缓存命中流量', value: total6.received_bytes - missedCache6.received_bytes })
      var halfAngle6 = (seriesData6[0].value / total6.received_bytes) * 360 / 2
      startAngle6 = startAngle6 + halfAngle6 - 5
    }
  }

  var pieOption = {
    legend: {
      show: false
    },
    title: {
      show: true,
      bottom: 0,
      left: 'center',
      textStyle: {
        fontSize: 14
      }
    },
    color: chartColor,
    animation: false,
    series: [
      {
        type: 'pie',
        radius: [45, 85],
        label: {
          formatter: '{b} {d}%',
          fontSize: 12,
        },
        center: ['50%', 130],
        itemStyle: {
          borderWidth: 1,
          borderColor: 'white'
        }
      }
    ]
  }
  function initEcharts6 () {
    var myChart = echarts.init(document.getElementById('canvas6'))
    var option = JSON.parse(JSON.stringify(pieOption))
    option.series[0].data = seriesData6
    option.title.text = total6 ? total6.server_idc_renter : '-'
    option.series[0].startAngle = startAngle6
    myChart.setOption(option)
    document.getElementById('imgCanvas6').src = myChart.getDataURL({pixelRatio: 1})
  }

  var total7 = top3Sessions[0]
  var seriesData7 = []
  var startAngle7 = 90
  if (total7) {
    var missedCache7 = missedCacheSession.find(t => total7.server_idc_renter ===  t.client_idc_renter)
    if (missedCache7) {
      seriesData7.push({ name: '缓存未命中会话', value: missedCache7.sessions })
      seriesData7.push({ name: '缓存命中会话', value: total7.sessions - missedCache7.sessions })
      var halfAngle7 = (seriesData7[0].value / total7.sessions) * 360 / 2
      startAngle7 = startAngle7 + halfAngle7 - 5
    }
  }
  function initEcharts7 () {
    var myChart = echarts.init(document.getElementById('canvas7'))
    var option = JSON.parse(JSON.stringify(pieOption))
    option.series[0].data = seriesData7
    option.title.text = total7 ? total7.server_idc_renter : '-'
    option.series[0].startAngle = startAngle7
    myChart.setOption(option)
    document.getElementById('imgCanvas7').src = myChart.getDataURL({pixelRatio: 1})
  }

  initEcharts1()
  initEcharts2()
  initEcharts3()
  initEcharts4()
  initEcharts5()
  initEcharts6()
  initEcharts7()
  initEcharts8()
  initEcharts9()
  initEcharts10()
  initEcharts11()
  initTimeRange()
</script>


<#function convertNumber value unitType step>
  <#local numberUnit = ["", "K", "M", "G", "T", "P", "E"]>
  <#local byteUnit = ["B", "KB", "MB", "GB", "TB", "PB", "EB"]>
  <#local byteRateUnit = ["bps", "Kbps", "Mbps", "Gbps", "Tbps", "Pbps", "Ebps"]>
  <#local currentUnit = numberUnit >
  <#local tempValue = value>
  <#local stepAddOne = false>
  <#if unitType == "byte">
    <#local currentUnit = byteUnit>
    <#if value gt 1024>
      <#local tempValue = value / 1024>
      <#local stepAddOne = true>
    </#if>
  <#elseif unitType == "bps">
    <#local currentUnit = byteRateUnit>
    <#if value gt 1000>
      <#local tempValue = value / 1000>
      <#local stepAddOne = true>
    </#if>
  <#elseif unitType == "number">
    <#local currentUnit = numberUnit>
  </#if>
  <#list currentUnit as unit>
    <#if tempValue / step gt 1>
      <#local tempValue = tempValue / step>
    <#else>
      <#if stepAddOne == true>
        <#return tempValue?string("0.##") + " " + currentUnit[unit_index + 1]>
      <#else>
        <#return tempValue?string("0.##") + " " + currentUnit[unit_index]>
      </#if>
    </#if>
  </#list>
</#function>

<#function getChainRatio value key param currentList prevList>
  <#local currentData=-1>
  <#local prevData=-1>
  
  <#local chainRatio=''>
  
  <#list currentList as val>
    <#if val[key]==value>
      <#local currentData=val[param]?eval>
    </#if>
  </#list>
  <#list prevList as pVal>
    <#if pVal[key]==value>
      <#local prevData=pVal[param]?eval>
    </#if>
  </#list>
  
  <#if currentData gt 0 && prevData gt 0>
    <#local currentRatio=(currentData - prevData) / prevData * 100>
    <#local chainRatio+=currentRatio?string("0.##") + '%'>
  <#else>
    <#local chainRatio+='-'>
  </#if>
  
  <#return chainRatio>
</#function>


<#function findRecordByName value key data1 list>
  <#local findIndex = -1>
  <#list list as d>
    <#if d[key] == value>
      <#local findIndex = d_index>
    </#if>
  </#list>
  <#return findIndex>
</#function>

<#function convertTime value>
  <#local timeUnit = [
    { "unit": 'ms', "step": 1 },
    { "unit": 's', "step": 1000 },
    { "unit": 'm', "step": 60 },
    { "unit": 'h', "step": 60 },
    { "unit": 'd', "step": 24 }
  ]>
  <#local i = 0>
  <#local temp = value>
  <#list timeUnit as unit>
    <#if (temp >= unit.step && i == unit_index)>
      <#local temp = temp / unit.step>
      <#local i = i+1>
    </#if>
  </#list>
  <#if (i > 0)>
    <#return temp?string("0.##") + " " + timeUnit[i-1].unit>
  <#else>
    <#return temp + " " + timeUnit[0].unit>
  </#if>
</#function>

</html>
