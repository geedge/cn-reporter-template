<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>网络服务质量监测报告(IDC精简版)</title>
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
    .header1, .header2, .header7, .header4 {
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
    .header7 {
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
  <div class="header1">网络服务质量监测报告(IDC精简版)<span class="header1__time" id="currentRange0"></span></div>
  <div class="header2">一.整体流量概况</div>
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
          <th class="table__th">总流量环比</th>
        </tr>
      </thead>
      <tr class="table__tr">
        <td class="table__td">
			<#if r7[0].rate_avg??>
				${convertNumber(r7[0].rate_avg,'bps',1000)}
			<#else>
			    -
			</#if>
		</td>
        <td class="table__td">
			<#if r7[0].rate_min??>
				${convertNumber(r7[0].rate_min,'bps',1000)}
			<#else>
			    -
			</#if>
		</td>
        <td class="table__td">
          <div class="td__quantile-group">
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p50"></div>
                  <div>P50</div>
                </div>
              </div>
              <div class="quantile__value">
				<#if r7[0].rate50??>
					${convertNumber(r7[0].rate50,'bps',1000)}
				<#else>
					-
				</#if>
			  </div>
            </div>
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p90"></div>
                  <div>P90</div>
                </div>
              </div>
              <div class="quantile__value">
				<#if r7[0].rate90??>
					${convertNumber(r7[0].rate90,'bps',1000)}
				<#else>
					-
				</#if>
			  </div>
            </div>
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p99"></div>
                  <div>P99</div>
                </div>
              </div>
              <div class="quantile__value">
				<#if r7[0].rate99??>
					${convertNumber(r7[0].rate99,'bps',1000)}
				<#else>
					-
				</#if>
			  </div>
            </div>
          </div>
        </td>
        <td class="table__td">
			<#if r7[0].rate_max??>
				${convertNumber(r7[0].rate_max,'bps',1000)}
			<#else>
				-
			</#if>
		</td>
        <td class="table__td">
			<#if r7[0].rate_avg?? && r4[0].rate_avg?? && r4[0].rate_avg?eval!=0>
				${(r7[0].rate_avg-r4[0].rate_avg)/r4[0].rate_avg * 100}%
			<#else>
			    0%
			</#if>
		</td>
        <td class="table__td">
			<#if r1[0].bytes??>
				${convertNumber(r1[0].bytes?eval,'byte',1024)}</td>
			<#else>
				-
			</#if>
		</td>
        <td class="table__td">
			<#if r1[0].bytes?? && r2[0].bytes?? && r2[0].bytes?eval!=0>
				${(r1[0].bytes?eval-r2[0].bytes?eval)/r2[0].bytes?eval * 100}%
			<#else>
			    0%
			</#if>
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
      <div class="echarts__title">图1 当日流量变化曲线</div>
    </div>
  </div>

  <div class="header2">二.业务流量排名</div>
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
        <th class="table__th">APP流量速率</th>
		  <#if r10??>
			<#list r10 as val>
				<th class="table__th">${val['app_company']}</th>
			</#list>
		  </#if>
      </tr>
      </thead>
      <tr class="table__tr font-size-14">
        <td class="table__td">峰值</td>
			<#if r10??>
				<#list r10 as val>
					<td class="table__td">${convertNumber(val.rate_max,'bps',1000)}</td>
				</#list>
			</#if>
      </tr>
      <tr class="table__tr font-size-14">
        <td class="table__td">均值</td>
			<#if r10??>
				<#list r10 as val>
					<td class="table__td">${convertNumber(val.rate_avg,'bps',1000)}</td>
				</#list>
			</#if>
      </tr>
    </table>
    <div class="echarts__title" style="padding-top: 10px;">图2 TOP10 APP流量情况</div>
  </div>

  <div class="header2">三.服务质量概况</div>
  <div class="header7">1.整体质量概况</div>
  <div class="table-box indent-3">
    <div class="table__title">表2 域内访问域外流量的服务质量</div>
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
              <div class="quantile__value">
				<#if r12[0].establish_latency_p50??>
					${convertTime(r12[0].establish_latency_p50)}
				<#else>
					-
				</#if>
			  </div>
            </div>
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p90"></div>
                  <div>P90</div>
                </div>
              </div>
              <div class="quantile__value">
				<#if r12[0].establish_latency_p90??>
					${convertTime(r12[0].establish_latency_p90)}
				<#else>
					-
				</#if>
			  </div>
            </div>
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p99"></div>
                  <div>P99</div>
                </div>
              </div>
              <div class="quantile__value">
				<#if r12[0].establish_latency_p99??>
					${convertTime(r12[0].establish_latency_p99)}
				<#else>
					-
				</#if>
			  </div>
            </div>
          </div>
        </td>
        <td class="table__td">
			<#if r12[0].establish_latency_max??>
				${convertTime(r12[0].establish_latency_max)}
			<#else>
				-
			</#if>
		</td>
        <td class="table__td">
			<#if r12[0].establish_latency_avg??>
				${convertTime(r12[0].establish_latency_avg)}
			<#else>
				-
			</#if>
		</td>
        <td class="table__td">
			<#if r12[0].establish_latency_avg?? && r13[0].establish_latency_avg?? && r13[0].establish_latency_avg !=0>
				${(r12[0].establish_latency_avg - r13[0].establish_latency_avg) / r13[0].establish_latency_avg * 100}%
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
              <div class="quantile__value">
				<#if r14[0].sequence_gap_loss_p50??>
					${r14[0].sequence_gap_loss_p50 * 100}%
				<#else>
					-
				</#if>
			  </div>
            </div>
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p90"></div>
                  <div>P90</div>
                </div>
              </div>
              <div class="quantile__value">
				<#if r14[0].sequence_gap_loss_p90??>
					${r14[0].sequence_gap_loss_p90 * 100}%
				<#else>
					-
				</#if>
			  </div>
            </div>
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p99"></div>
                  <div>P99</div>
                </div>
              </div>
              <div class="quantile__value">
				<#if r14[0].sequence_gap_loss_p99??>
					${r14[0].sequence_gap_loss_p99 * 100}%
				<#else>
					-
				</#if>
			  </div>
            </div>
          </div>
        </td>
        <td class="table__td">
			<#if r14[0].sequence_gap_loss_max??>
				${r14[0].sequence_gap_loss_max * 100}%
			<#else>
				-
			</#if>
		</td>
        <td class="table__td">
			<#if r14[0].sequence_gap_loss_avg??>
				${r14[0].sequence_gap_loss_avg * 100}%
			<#else>
				-
			</#if>
		</td>
        <td class="table__td">
			<#if r14[0].sequence_gap_loss_avg?? && r15[0].sequence_gap_loss_avg?? && r15[0].sequence_gap_loss_avg !=0>
				${(r14[0].sequence_gap_loss_avg - r15[0].sequence_gap_loss_avg) / r15[0].sequence_gap_loss_avg * 100}%
			<#else>
			 0%
			</#if>
		</td>
      </tr>
    </table>
  </div>
  <div class="table-box indent-3">
    <div class="table__title">表3 域外访问域内流量的服务质量</div>
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
              <div class="quantile__value">
				<#if r16[0].establish_latency_p50??>
					${convertTime(r16[0].establish_latency_p50)}
				<#else>
					-
				</#if>
			  </div>
            </div>
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p90"></div>
                  <div>P90</div>
                </div>
              </div>
              <div class="quantile__value">
				<#if r16[0].establish_latency_p90??>
					${convertTime(r16[0].establish_latency_p90)}
				<#else>
					-
				</#if>
			  </div>
            </div>
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p99"></div>
                  <div>P99</div>
                </div>
              </div>
              <div class="quantile__value">
				<#if r16[0].establish_latency_p99??>
					${convertTime(r16[0].establish_latency_p99)}
				<#else>
					-
				</#if>
			  </div>
            </div>
          </div>
        </td>
        <td class="table__td">
			<#if r16[0].establish_latency_max??>
				${convertTime(r16[0].establish_latency_max)}
			<#else>
				-
			</#if>
		</td>
        <td class="table__td">
			<#if r16[0].establish_latency_avg??>
				${convertTime(r16[0].establish_latency_avg)}
			<#else>
				-
			</#if>
		</td>
        <td class="table__td">
			<#if r16[0].establish_latency_avg?? && r17[0].establish_latency_avg?? && r17[0].establish_latency_avg !=0>
				${(r16[0].establish_latency_avg - r17[0].establish_latency_avg) / r17[0].establish_latency_avg * 100}%
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
              <div class="quantile__value">
				<#if r18[0].sequence_gap_loss_p50??>
					${r18[0].sequence_gap_loss_p50 * 100}%
				<#else>
					-
				</#if>
			  </div>
            </div>
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p90"></div>
                  <div>P90</div>
                </div>
              </div>
              <div class="quantile__value">
				<#if r18[0].sequence_gap_loss_p90??>
					${r18[0].sequence_gap_loss_p90 * 100}%
				<#else>
					-
				</#if>
			  </div>
            </div>
            <div class="td__quantile">
              <div class="quantile__label">
                <div class="label-box">
                  <div class="quantile__point quantile__point--p99"></div>
                  <div>P99</div>
                </div>
              </div>
              <div class="quantile__value">
				<#if r18[0].sequence_gap_loss_p99??>
					${r18[0].sequence_gap_loss_p99 * 100}%
				<#else>
					-
				</#if>
			  </div>
            </div>
          </div>
        </td>
        <td class="table__td">
			<#if r18[0].sequence_gap_loss_max??>
				${r18[0].sequence_gap_loss_max * 100}%
			<#else>
				-
			</#if>
		</td>
        <td class="table__td">
			<#if r18[0].sequence_gap_loss_avg??>
				${r18[0].sequence_gap_loss_avg * 100}%
			<#else>
				-
			</#if>
		</td>
        <td class="table__td">
			<#if r18[0].sequence_gap_loss_avg?? && r19[0].sequence_gap_loss_avg?? && r19[0].sequence_gap_loss_avg !=0>
				${(r18[0].sequence_gap_loss_avg - r19[0].sequence_gap_loss_avg) / r19[0].sequence_gap_loss_avg * 100}%
			<#else>
			 0%
			</#if>
		</td>
      </tr>
    </table>
  </div>
  <div class="header7">2.业务质量概况</div>
  <div class="table-box indent-3">
    <div class="table__title">表4 TOP10 APP服务质量情况</div>
    <table class="table">
      <thead class="table__header">
        <tr class="table__tr">
          <th rowspan="2" class="table__th">APP</th>
          <th rowspan="2" class="table__th">流量占比</th>
          <th colspan="3" class="table__th">TCP会话延迟(ms)</th>
          <th colspan="3" class="table__th">缺包率</th>
        </tr>
        <tr class="table__tr">
          <th class="table__th">P50 P90 P99</th>
          <th class="table__th">均值</th>
          <th class="table__th">均值环比</th>
          <th class="table__th">P50 P90 P99</th>
          <th class="table__th">均值</th>
          <th class="table__th">均值环比</th>
        </tr>
      </thead>
      <#if r20??>
		<#list r20 as val>
		  <tr class="table__tr">
			<td class="table__td">${val['app_company']}</td>
			<td class="table__td">${r10[findRecordByName(val['app_company'], 'app_company', val, r10)]['bytes']?eval / r1[0].bytes?eval * 100}%</td>
			<td class="table__td">
			  <div class="td__quantile-group">
				<div class="td__quantile">
				  <div class="quantile__label">
					<div class="label-box">
					  <div class="quantile__point quantile__point--p50"></div>
					  <div>P50</div>
					</div>
				  </div>
				  <div class="quantile__value">${convertTime(r20[findRecordByName(val['app_company'], 'app_company', val, r20)]['establish_latency_p50'])}</div>
				</div>
				<div class="td__quantile">
				  <div class="quantile__label">
					<div class="label-box">
					  <div class="quantile__point quantile__point--p90"></div>
					  <div>P90</div>
					</div>
				  </div>
				  <div class="quantile__value">${convertTime(r20[findRecordByName(val['app_company'], 'app_company', val, r20)]['establish_latency_p90'])}</div>
				</div>
				<div class="td__quantile">
				  <div class="quantile__label">
					<div class="label-box">
					  <div class="quantile__point quantile__point--p99"></div>
					  <div>P99</div>
					</div>
				  </div>
				  <div class="quantile__value">${convertTime(r20[findRecordByName(val['app_company'], 'app_company', val, r20)]['establish_latency_p99'])}</div>
				</div>
			  </div>
			</td>
			<td class="table__td">${convertTime(r20[findRecordByName(val['app_company'], 'app_company', val, r20)]['establish_latency_avg'])}</td>
			<td class="table__td">${getChainRatio(val['app_company'],"app_company","establish_latency_avg",r20,r21)}</td>
			<td class="table__td">
			  <div class="td__quantile-group">
				<div class="td__quantile">
				  <div class="quantile__label">
					<div class="label-box">
					  <div class="quantile__point quantile__point--p50"></div>
					  <div>P50</div>
					</div>
				  </div>
				  <div class="quantile__value">${r22[findRecordByName(val['app_company'], 'app_company', val, r22)]['sequence_gap_loss_p50'] * 100}%</div>
				</div>
				<div class="td__quantile">
				  <div class="quantile__label">
					<div class="label-box">
					  <div class="quantile__point quantile__point--p90"></div>
					  <div>P90</div>
					</div>
				  </div>
				  <div class="quantile__value">${r22[findRecordByName(val['app_company'], 'app_company', val, r22)]['sequence_gap_loss_p90'] * 100}%</div>
				</div>
				<div class="td__quantile">
				  <div class="quantile__label">
					<div class="label-box">
					  <div class="quantile__point quantile__point--p99"></div>
					  <div>P99</div>
					</div>
				  </div>
				  <div class="quantile__value">${r22[findRecordByName(val['app_company'], 'app_company', val, r22)]['sequence_gap_loss_p99'] * 100}%</div>
				</div>
			  </div>
			</td>
			<td class="table__td">
				<#if r22?? && findRecordByName(val['app_company'], 'app_company', val, r22) != -1>
					${r22[findRecordByName(val['app_company'], 'app_company', val, r22)]['sequence_gap_loss_avg'] * 100}%
				<#else>
				    —
				</#if>
			</td>
			<td class="table__td">
				<#if r22?? && r23?? && findRecordByName(val['app_company'], 'app_company', val, r22) != -1 && findRecordByName(val['app_company'], 'app_company', val, r23) != -1
				  && r23[findRecordByName(val['app_company'], 'app_company', val, r22)]['sequence_gap_loss_avg'] !=0 >
					${(r22[findRecordByName(val['app_company'], 'app_company', val, r22)]['sequence_gap_loss_avg'] - r23[findRecordByName(val['app_company'], 'app_company', val, r23)]['sequence_gap_loss_avg']) / r23[findRecordByName(val['app_company'], 'app_company', val, r23)]['sequence_gap_loss_avg'] * 100}%
				  <#else>
					 — 
				  </#if>
			</td>
		  </tr>
		  </#list>
	  </#if>
    </table>
  </div>

  <div class="header2">四.地理位置分布</div>
  <div class="header7">1.各省份流量分布</div>

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
		<#if r24??>
			<#list r24 as val>
				<th class="table__th">${val['client_province']}</th>
			</#list>
		</#if>
      </tr>
      </thead>
      <tr class="table__tr font-size-14">
        <td class="table__td">上行均值</td>
		<#if r24??>
			<#list r24 as val>
				<td class="table__td">${convertNumber(val['egress_rate_avg'],'bps',1000)}</td>
			</#list>
		</#if>
      </tr>
      
      <tr class="table__tr font-size-14">
        <td class="table__td">上行峰值</td>
        <#if r24??>
			<#list r24 as val>
				<td class="table__td">${convertNumber(val['egress_rate_max'],'bps',1000)}</td>
			</#list>
		</#if>
      </tr>
      
    </table>
    <div class="echarts__title" style="padding-top: 10px;">图3 域外访问域内服务的TOP10省份流量分布</div>
  </div>
  
  <div class="echarts-box indent-3">
      <div class="echarts">
          <div class="echarts__canvas" id="canvas25" style="width: 1100px; height: 400px; display: none; -webkit-tap-highlight-color: transparent; user-select: none;" _echarts_instance_="ec_1651201575769"><div style="position: relative; width: 1100px; height: 400px; padding: 0px; margin: 0px; border-width: 0px;"><canvas data-zr-dom-id="zr_0" width="1100" height="400" style="position: absolute; left: 0px; top: 0px; width: 1100px; height: 400px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div></div>
          <img height="400" width="1100" id="imgCanvas25">
      </div>
  </div>
  <div class="table-box indent-3">
      <table class="table">
          <thead class="table__header">
          <tr class="table__tr">
              <th class="table__th">各省份流量速率</th>
              <#if r24??>
				<#list r24 as val>
					<th class="table__th">${val['client_province']}</th>
				</#list>
			</#if>
          </tr>
          </thead>
          <tbody>
		  <tr class="table__tr font-size-14">
			<td class="table__td">下行均值</td>
			<#if r24??>
				<#list r24 as val>
					<td class="table__td">${convertNumber(val['ingress_rate_avg'],'bps',1000)}</td>
				</#list>
			</#if>
		  </tr>
          <tr class="table__tr font-size-14">
			<td class="table__td">下行峰值</td>
			<#if r24??>
				<#list r24 as val>
					<td class="table__td">${convertNumber(val['ingress_rate_max'],'bps',1000)}</td>
				</#list>
			</#if>
		  </tr>
          </tbody></table>
      <div class="echarts__title" style="padding-top: 10px;">图4 域外访问域内服务的TOP10省份流量分布</div>
  </div>
  
  
  
  <div class="echarts-box indent-3">
    <div class="echarts">
      <div class="echarts__canvas" id="canvas17" style="width: 1100px; height: 400px; display: none;"></div>
      <img height="400" width="1100" id="imgCanvas17"/>
    </div>
  </div>
  <div class="table-box indent-3">
    <table class="table">
      <thead class="table__header">
      <tr class="table__tr">
        <th class="table__th">各省份流量速率</th>
		<#if r26??>
			<#list r26 as val>
				<th class="table__th">${val['server_province']}</th>
			</#list>
		</#if>
      </tr>
      </thead>
      <tr class="table__tr font-size-14">
        <td class="table__td">上行均值</td>
        <#if r26??>
			<#list r26 as val>
				<td class="table__td">${convertNumber(val['egress_rate_avg'],'bps',1000)}</td>
			</#list>
		</#if>
      </tr>
      
      <tr class="table__tr font-size-14">
        <td class="table__td">上行峰值</td>
        <#if r26??>
			<#list r26 as val>
				<td class="table__td">${convertNumber(val['egress_rate_max'],'bps',1000)}</td>
			</#list>
		</#if>
      </tr>
      
    </table>
    <div class="echarts__title" style="padding-top: 10px;">图5 域内访问域外服务的TOP10省份流量分布</div>
  </div>
  
  
  <div class="echarts-box indent-3">
      <div class="echarts">
          <div class="echarts__canvas" id="canvas26" style="width: 1100px; height: 400px; display: none; -webkit-tap-highlight-color: transparent; user-select: none;" _echarts_instance_="ec_1651201575783"><div style="position: relative; width: 1100px; height: 400px; padding: 0px; margin: 0px; border-width: 0px;"><canvas data-zr-dom-id="zr_0" width="1100" height="400" style="position: absolute; left: 0px; top: 0px; width: 1100px; height: 400px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div></div>
          <img height="400" width="1100" id="imgCanvas26">
      </div>
  </div>
  <div class="table-box indent-3">
      <table class="table">
          <thead class="table__header">
          <tr class="table__tr">
              <th class="table__th">各省份流量速率</th>
              <#if r26??>
					<#list r26 as val>
						<th class="table__th">${val['server_province']}</th>
					</#list>
				</#if>
          </tr>
          </thead>
          <tbody>
          <tr class="table__tr font-size-14">
			<td class="table__td">下行均值</td>
			<#if r26??>
				<#list r26 as val>
					<td class="table__td">${convertNumber(val['ingress_rate_avg'],'bps',1000)}</td>
				</#list>
			</#if>
		  </tr>
          <tr class="table__tr font-size-14">
			<td class="table__td">下行峰值</td>
			<#if r26??>
				<#list r26 as val>
					<td class="table__td">${convertNumber(val['ingress_rate_max'],'bps',1000)}</td>
				</#list>
			</#if>
		  </tr>
          </tbody></table>
      <div class="echarts__title" style="padding-top: 10px;">图6 域内访问域外服务的TOP10省份流量分布</div>
  </div>
  
  
  <div class="table-box indent-3">
    <table class="table table-contain-echarts">
      <thead class="table__header">
      <tr class="table__tr">
		<#if r28??>
			<#list r28 as val>
				<th class="table__th">${val['client_province']}</th>
			</#list>
		</#if>
      </tr>
      </thead>
      <tr class="table__tr">
        <td class="table__td">
          <div class="echarts-box">
            <div class="echarts">
              <div class="echarts__canvas" id="canvas4" style="width: 360px; height: 200px; display: none;"></div>
              <img height="200" width="360" id="imgCanvas4"/>
            </div>
          </div>
        </td>
        <td class="table__td">
          <div class="echarts-box">
            <div class="echarts">
              <div class="echarts__canvas" id="canvas5" style="width: 360px; height: 200px; display: none;"></div>
              <img height="200" width="360" id="imgCanvas5"/>
            </div>
          </div>
        </td>
        <td class="table__td">
          <div class="echarts-box">
            <div class="echarts">
              <div class="echarts__canvas" id="canvas6" style="width: 360px; height: 200px; display: none;"></div>
              <img height="200" width="360" id="imgCanvas6"/>
            </div>
          </div>
        </td>
      </tr>
    </table>
  </div>
  <div class="echarts__legends">
    <div class="echarts__legend">
      <div class="color-block blue"></div>
      <div class="legend-text" id="currentRange5"></div>
    </div>
    <div class="echarts__legend">
      <div class="color-block green"></div>
      <div class="legend-text" id="prevRange5"></div>
    </div>
  </div>
  <div class="echarts__title">图7 TOP3省份访问域内主要APP的流量占比</div>

  <div class="table-box indent-3">
    <table class="table table-contain-echarts">
      <thead class="table__header">
      <tr class="table__tr">
		<#if r36??>
			<#list r36 as val>
				<th class="table__th">${val['app_company']}</th>
			</#list>
		</#if>
      </tr>
      </thead>
      <tr class="table__tr">
        <td class="table__td">
          <div class="echarts-box">
            <div class="echarts">
              <div class="echarts__canvas" id="canvas7" style="width: 360px; height: 200px; display: none;"></div>
              <img height="200" width="360" id="imgCanvas7"/>
            </div>
          </div>
        </td>
        <td class="table__td">
          <div class="echarts-box">
            <div class="echarts">
              <div class="echarts__canvas" id="canvas8" style="width: 360px; height: 200px; display: none;"></div>
              <img height="200" width="360" id="imgCanvas8"/>
            </div>
          </div>
        </td>
        <td class="table__td">
          <div class="echarts-box">
            <div class="echarts">
              <div class="echarts__canvas" id="canvas9" style="width: 360px; height: 200px; display: none;"></div>
              <img height="200" width="360" id="imgCanvas9"/>
            </div>
          </div>
        </td>
      </tr>
    </table>
  </div>
  <div class="echarts__legends">
    <div class="echarts__legend">
      <div class="color-block blue"></div>
      <div class="legend-text" id="currentRange6"></div>
    </div>
    <div class="echarts__legend">
      <div class="color-block green"></div>
      <div class="legend-text" id="prevRange6"></div>
    </div>
  </div>
  <div class="echarts__title">图8 访问域内TOP3 APP的各省份流量占比</div>

  <div class="header7">2.省内各地区流量分布</div>

  <div class="echarts-box indent-3">
    <div class="echarts">
      <div class="echarts__canvas" id="canvas10" style="width: 1100px; height: 400px; display: none;"></div>
      <img height="400" width="1100" id="imgCanvas10"/>
    </div>
  </div>

  <div class="table-box indent-3">
    <table class="table">
      <thead class="table__header">
      <tr class="table__tr">
        <th class="table__th">各地区流量速率</th>
		<#if r44??>
			<#list r44 as val>
				<th class="table__th">${val['client_region']}</th>
			</#list>
		</#if>
      </tr>
      </thead>
      <tr class="table__tr font-size-14">
        <td class="table__td">上行均值</td>
        <#if r44??>
			<#list r44 as val>
				<td class="table__td">${convertNumber(val['egress_rate_avg'],'bps',1000)}</td>
			</#list>
		</#if>
      </tr>
      
      <tr class="table__tr font-size-14">
        <td class="table__td">上行峰值</td>
        <#if r44??>
			<#list r44 as val>
				<td class="table__td">${convertNumber(val['egress_rate_max'],'bps',1000)}</td>
			</#list>
		</#if>
      </tr>
      
    </table>
    <div class="echarts__title" style="padding-top: 10px;">图9 域外访问域内服务的TOP 10省内地区流量分布</div>
  </div>
  
  <div class="echarts-box indent-3">
      <div class="echarts">
          <div class="echarts__canvas" id="canvas27" style="width: 1100px; height: 400px; display: none; -webkit-tap-highlight-color: transparent; user-select: none;" _echarts_instance_="ec_1651201575776"><div style="position: relative; width: 1100px; height: 400px; padding: 0px; margin: 0px; border-width: 0px;"><canvas data-zr-dom-id="zr_0" width="1100" height="400" style="position: absolute; left: 0px; top: 0px; width: 1100px; height: 400px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div></div>
          <img height="400" width="1100" id="imgCanvas27">
      </div>
  </div>

  <div class="table-box indent-3">
      <table class="table">
          <thead class="table__header">
          <tr class="table__tr">
              <th class="table__th">各地区流量速率</th>
              <#if r44??>
				<#list r44 as val>
					<th class="table__th">${val['client_region']}</th>
				</#list>
			</#if>
          </tr>
          </thead>
          <tbody>
          <tr class="table__tr font-size-14">
			<td class="table__td">下行均值</td>
			<#if r44??>
				<#list r44 as val>
					<td class="table__td">${convertNumber(val['ingress_rate_avg'],'bps',1000)}</td>
				</#list>
			</#if>
		  </tr>
          <tr class="table__tr font-size-14">
			<td class="table__td">下行峰值</td>
			<#if r44??>
				<#list r44 as val>
					<td class="table__td">${convertNumber(val['ingress_rate_max'],'bps',1000)}</td>
				</#list>
			</#if>
		  </tr>
          </tbody></table>
      <div class="echarts__title" style="padding-top: 10px;">图10 域外访问域内服务的TOP 10省内地区流量分布</div>
  </div>

  <div class="echarts-box indent-3">
    <div class="echarts">
      <div class="echarts__canvas" id="canvas18" style="width: 1100px; height: 400px; display: none;"></div>
      <img height="400" width="1100" id="imgCanvas18"/>
    </div>
  </div>

  <div class="table-box indent-3">
    <table class="table">
      <thead class="table__header">
      <tr class="table__tr">
        <th class="table__th">各地区流量速率</th>
        <#if r46??>
			<#list r46 as val>
				<th class="table__th">${val['server_region']}</th>
			</#list>
		</#if>
      </tr>
      </thead>
      <tr class="table__tr font-size-14">
        <td class="table__td">上行均值</td>
        <#if r46??>
			<#list r46 as val>
				<td class="table__td">${convertNumber(val['egress_rate_avg'],'bps',1000)}</td>
			</#list>
		</#if>
      </tr>
      
      <tr class="table__tr font-size-14">
        <td class="table__td">上行峰值</td>
        <#if r46??>
			<#list r46 as val>
				<td class="table__td">${convertNumber(val['egress_rate_max'],'bps',1000)}</td>
			</#list>
		</#if>
      </tr>
      
    </table>
    <div class="echarts__title" style="padding-top: 10px;">图11 域内访问域外服务的TOP 10省内地区流量分布</div>
  </div>

  <div class="echarts-box indent-3">
      <div class="echarts">
          <div class="echarts__canvas" id="canvas28" style="width: 1100px; height: 400px; display: none; -webkit-tap-highlight-color: transparent; user-select: none;" _echarts_instance_="ec_1651201575784"><div style="position: relative; width: 1100px; height: 400px; padding: 0px; margin: 0px; border-width: 0px;"><canvas data-zr-dom-id="zr_0" width="1100" height="400" style="position: absolute; left: 0px; top: 0px; width: 1100px; height: 400px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div></div>
          <img height="400" width="1100" id="imgCanvas28">
      </div>
  </div>

  <div class="table-box indent-3">
      <table class="table">
          <thead class="table__header">
          <tr class="table__tr">
              <th class="table__th">各地区流量速率</th>
              <#if r46??>
				<#list r46 as val>
					<th class="table__th">${val['server_region']}</th>
				</#list>
			</#if>
          </tr>
          </thead>
          <tbody>
          <tr class="table__tr font-size-14">
			<td class="table__td">下行均值</td>
			<#if r46??>
				<#list r46 as val>
					<td class="table__td">${convertNumber(val['ingress_rate_avg'],'bps',1000)}</td>
				</#list>
			</#if>
		  </tr>
          <tr class="table__tr font-size-14">
			<td class="table__td">下行峰值</td>
			<#if r46??>
				<#list r46 as val>
					<td class="table__td">${convertNumber(val['ingress_rate_max'],'bps',1000)}</td>
				</#list>
			</#if>
		  </tr>
          </tbody></table>
      <div class="echarts__title" style="padding-top: 10px;">图12 域内访问域外服务的TOP 10省内地区流量分布</div>
  </div>


  <div class="table-box indent-3">
    <table class="table table-contain-echarts">
      <thead class="table__header">
      <tr class="table__tr">
		<#if r48??>
			<#list r48 as val>
				<th class="table__th">${val['client_region']}</th>
			</#list>
		</#if>
      </tr>
      </thead>
      <tr class="table__tr">
        <td class="table__td">
          <div class="echarts-box">
            <div class="echarts">
              <div class="echarts__canvas" id="canvas11" style="width: 360px; height: 200px; display: none;"></div>
              <img height="200" width="360" id="imgCanvas11"/>
            </div>
          </div>
        </td>
        <td class="table__td">
          <div class="echarts-box">
            <div class="echarts">
              <div class="echarts__canvas" id="canvas12" style="width: 360px; height: 200px; display: none;"></div>
              <img height="200" width="360" id="imgCanvas12"/>
            </div>
          </div>
        </td>
        <td class="table__td">
          <div class="echarts-box">
            <div class="echarts">
              <div class="echarts__canvas" id="canvas13" style="width: 360px; height: 200px; display: none;"></div>
              <img height="200" width="360" id="imgCanvas13"/>
            </div>
          </div>
        </td>
      </tr>
    </table>
  </div>
  <div class="echarts__legends">
    <div class="echarts__legend">
      <div class="color-block blue"></div>
      <div class="legend-text" id="currentRange9"></div>
    </div>
    <div class="echarts__legend">
      <div class="color-block green"></div>
      <div class="legend-text" id="prevRange9"></div>
    </div>
  </div>
  <div class="echarts__title">图13 TOP3省内各地区访问域内主要APP的流量分布</div>

  <div class="table-box indent-3">
    <table class="table table-contain-echarts">
      <thead class="table__header">
        <tr class="table__tr">
			<#if r56??>
				<#list r56 as val>
					<th class="table__th">${val['app_company']}</th>
				</#list>
			</#if>
        </tr>
      </thead>
      <tr class="table__tr">
        <td class="table__td">
          <div class="echarts-box">
            <div class="echarts">
              <div class="echarts__canvas" id="canvas14" style="width: 360px; height: 200px; display: none;"></div>
              <img height="200" width="360" id="imgCanvas14"/>
            </div>
          </div>
        </td>
        <td class="table__td">
          <div class="echarts-box">
            <div class="echarts">
              <div class="echarts__canvas" id="canvas15" style="width: 360px; height: 200px; display: none;"></div>
              <img height="200" width="360" id="imgCanvas15"/>
            </div>
          </div>
        </td>
        <td class="table__td">
          <div class="echarts-box">
            <div class="echarts">
              <div class="echarts__canvas" id="canvas16" style="width: 360px; height: 200px; display: none;"></div>
              <img height="200" width="360" id="imgCanvas16"/>
            </div>
          </div>
        </td>
      </tr>
    </table>
  </div>

  <div class="echarts__legends">
    <div class="echarts__legend">
      <div class="color-block blue"></div>
      <div class="legend-text" id="currentRange10"></div>
    </div>
    <div class="echarts__legend">
      <div class="color-block green"></div>
      <div class="legend-text" id="prevRange10"></div>
    </div>
  </div>
  <div class="echarts__title">图14 访问域内TOP3 APP的省内地区流量占比</div>

  <div class="header2">五.IDC租用方内容收敛情况</div>
  <div class="echarts-box indent-3">
    <div class="echarts">
      <div class="echarts__canvas" id="canvas19" style="width: 367px; height: 280px; display: none;"></div>
      <img height="280" width="367" id="imgCanvas19"/>
    </div>
    <div class="echarts">
      <div class="echarts__canvas" id="canvas20" style="width: 366px; height: 280px; display: none;"></div>
      <img height="280" width="366" id="imgCanvas20"/>
    </div>
    <div class="echarts">
      <div class="echarts__canvas" id="canvas21" style="width: 367px; height: 280px; display: none;"></div>
      <img height="280" width="367" id="imgCanvas21"/>
    </div>
  </div>
  <div class="echarts__title">图15 TOP3 IDC租用方缓存命中流量占比</div>

  <div class="echarts-box indent-3">
    <div class="echarts">
      <div class="echarts__canvas" id="canvas22" style="width: 367px; height: 280px; display: none;"></div>
      <img height="280" width="367" id="imgCanvas22"/>
    </div>
    <div class="echarts">
      <div class="echarts__canvas" id="canvas23" style="width: 366px; height: 280px; display: none;"></div>
      <img height="280" width="366" id="imgCanvas23"/>
    </div>
    <div class="echarts">
      <div class="echarts__canvas" id="canvas24" style="width: 367px; height: 280px; display: none;"></div>
      <img height="280" width="367" id="imgCanvas24"/>
    </div>
  </div>
  <div class="echarts__title">图16 TOP3 IDC租用方缓存命中会话占比</div>
</body>
<script>
  /** 数据 begin */
  // 时间区间
  var timeRange = [${startTime}, ${endTime}]
  /* 1.1 流量变化曲线 */
  // sql-9
  var trafficData = [
    <#if r9??>
		<#list r9 as d>
			{stat_time:${d.stat_time?eval * 1000}, rate:${d.rate?eval/1000}},
		</#list>
	</#if>
  ]
  // sql-7
  var quantile1 = {
    p50: ${r7[0].rate50/1000},
    p90: ${r7[0].rate90/1000},
    p99: ${r7[0].rate99/1000}
  }
  // sql-1 总流量
  var totalTraffic = ${r1[0].bytes?eval / 1024}
  // sql-2 prev总流量
  var prevTotalTraffic = ${r2[0].bytes?eval / 1024}
  // sql-3 域外访问域内总流量
  var outToInTotalTraffic = ${r3[0].bytes?eval / 1024}
  var outToInEgressTraffic = ${r3[0].egress_bytes?eval /1024}
  var outToInIngressTraffic = ${r3[0].ingress_bytes?eval /1024}
  // sql-4 prev域外访问域内总流量
  var prevOutToInTotalTraffic = ${r4[0].bytes?eval / 1024}
  // sql-5 域内访问域外总流量
  var inToOutTotalTraffic = ${r5[0].bytes?eval / 1024}
  var inToOutEgressTraffic = ${r5[0].egress_bytes?eval / 1024}
  var inToOutIngressTraffic = ${r5[0].ingress_bytes?eval / 1024}
  // sql-6 prev域内访问域外总流量
  var prevInToOutTotalTraffic = ${r6[0].bytes?eval / 1024}
  
  // sql-68
  var outToInRegionEgressTraffic = ${r68[0].egress_bytes?eval /1024}
  var outToInRegionIngressTraffic = ${r68[0].ingress_bytes?eval /1024}
  // sql-70
  var inToOutRegionEgressTraffic = ${r70[0].egress_bytes?eval / 1024}
  var inToOutRegionIngressTraffic = ${r70[0].ingress_bytes?eval / 1024}

  /* 2.1 top10 app流量情况 */
  // sql-10
  var overallAppTraffic = [
	<#if r10??>
		<#list r10 as d>	{app_company:'${d['app_company']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")}},
		</#list>
	</#if>
  ]
  // sql-11
  var prevOverallAppTraffic = [
	<#if r11??>
		<#list r11 as d>	{app_company:'${d['app_company']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")}},
		</#list>
	</#if>
  ]

  /* 4.1 各省份流量分布 */

  // sql-24 Top 10省份流量分布（域外访问域内）
  var top10ProvinceOutToInTraffic = [
    <#if r24??>
		<#list r24 as d>	{client_province:'${d['client_province']}',egress_bytes:${((d['egress_bytes']?eval)/1024)?string("0.####")},ingress_bytes:${((d['ingress_bytes']?eval)/1024)?string("0.####")},bytes:${((d['bytes']?eval)/1024)?string("0.####")},egress_rate_avg:'${d['egress_rate_avg']}',egress_rate_max:'${d['egress_rate_max']}',egress_rate_min:'${d['egress_rate_min']}',ingress_rate_avg:'${d['ingress_rate_avg']}',ingress_rate_max:'${d['ingress_rate_max']}',ingress_rate_min:'${d['ingress_rate_min']}'},
		</#list>
	</#if>
  ]
  // sql-25
  var prevTop10ProvinceOutToInTraffic = [
	<#if r25??>
		<#list r25 as d>	{client_province:'${d['client_province']}',egress_bytes:${((d['egress_bytes']?eval)/1024)?string("0.####")},ingress_bytes:${((d['ingress_bytes']?eval)/1024)?string("0.####")},bytes:${((d['bytes']?eval)/1024)?string("0.####")},egress_rate_avg:'${d['egress_rate_avg']}',egress_rate_max:'${d['egress_rate_max']}',egress_rate_min:'${d['egress_rate_min']}',ingress_rate_avg:'${d['ingress_rate_avg']}',ingress_rate_max:'${d['ingress_rate_max']}',ingress_rate_min:'${d['ingress_rate_min']}'},
		</#list>
	</#if>
  ]

  // sql-26 Top 10省份流量分布（域内访问域外）
  var top10ProvinceInToOutTraffic = [
	<#if r26??>
		<#list r26 as d>	{server_province:'${d['server_province']}',egress_bytes:${((d['egress_bytes']?eval)/1024)?string("0.####")},ingress_bytes:${((d['ingress_bytes']?eval)/1024)?string("0.####")},bytes:${((d['bytes']?eval)/1024)?string("0.####")},egress_rate_avg:'${d['egress_rate_avg']}',egress_rate_max:'${d['egress_rate_max']}',egress_rate_min:'${d['egress_rate_min']}',ingress_rate_avg:'${d['ingress_rate_avg']}',ingress_rate_max:'${d['ingress_rate_max']}',ingress_rate_min:'${d['ingress_rate_min']}'},
		</#list>
	</#if>
  ]
  // sql-27
  var prevTop10ProvinceInToOutTraffic = [
	<#if r27??>
		<#list r27 as d>	{server_province:'${d['server_province']}',egress_bytes:${((d['egress_bytes']?eval)/1024)?string("0.####")},ingress_bytes:${((d['ingress_bytes']?eval)/1024)?string("0.####")},bytes:${((d['bytes']?eval)/1024)?string("0.####")},egress_rate_avg:'${d['egress_rate_avg']}',egress_rate_max:'${d['egress_rate_max']}',egress_rate_min:'${d['egress_rate_min']}',ingress_rate_avg:'${d['ingress_rate_avg']}',ingress_rate_max:'${d['ingress_rate_max']}',ingress_rate_min:'${d['ingress_rate_min']}'},
		</#list>
	</#if>
  ]

  /* 4.1 top3省份访问域内的主要app流量 */
  // sql-28
  var totalTop3ProvinceTraffic = [
	<#if r28??>
		<#list r28 as d>	{client_province:'${d['client_province']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")}},</#list>
	</#if>
  ]
  // sql-29
  var prevTotalTop3ProvinceTraffic = [
    <#if r29??>
		<#list r29 as d>	{client_province:'${d['client_province']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")}},</#list>
	</#if>
  ]
  // sql-30 32 34
  var top3ProvinceAppTraffic = [
	<#if r30??>
		<#list r30 as d>	
			{client_province:'${d['client_province']}',app_company:'${d['app_company']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
	<#if r32??>
		<#list r32 as d>	
			{client_province:'${d['client_province']}',app_company:'${d['app_company']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
	<#if r34??>
		<#list r34 as d>	
			{client_province:'${d['client_province']}',app_company:'${d['app_company']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
  ]
  // sql-31 33 35
  var prevTop3ProvinceAppTraffic = [
	<#if r31??>
		<#list r31 as d>	
			{client_province:'${d['client_province']}',app_company:'${d['app_company']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
	<#if r33??>
		<#list r33 as d>	
			{client_province:'${d['client_province']}',app_company:'${d['app_company']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
	<#if r35??>
		<#list r35 as d>	
			{client_province:'${d['client_province']}',app_company:'${d['app_company']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
  ]
  /* 4.1 访问域内Top 3 APP 各省份流量占比 */
  // sql-36
  var totalTop3AppProvinceTraffic = [
	<#if r36??>
		<#list r36 as d>	
			{app_company:'${d['app_company']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},},
		</#list>
	</#if>
  ]
  // sql-37
  var prevTotalTop3AppProvinceTraffic = [
    <#if r37??>
		<#list r37 as d>	
			{app_company:'${d['app_company']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},},
		</#list>
	</#if>
  ]
  // sql-38 40 42
  var top3AppProvinceTraffic = [
	<#if r38??>
		<#list r38 as d>	
			{app_company:'${d['app_company']}',client_province:'${d['client_province']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
    <#if r40??>
		<#list r40 as d>	
			{app_company:'${d['app_company']}',client_province:'${d['client_province']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
	<#if r42??>
		<#list r42 as d>	
			{app_company:'${d['app_company']}',client_province:'${d['client_province']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
  ]
  // sql-39 41 43
  var prevTop3AppProvinceTraffic = [
    <#if r39??>
		<#list r39 as d>	
			{app_company:'${d['app_company']}',client_province:'${d['client_province']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
    <#if r41??>
		<#list r41 as d>	
			{app_company:'${d['app_company']}',client_province:'${d['client_province']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
	<#if r43??>
		<#list r43 as d>	
			{app_company:'${d['app_company']}',client_province:'${d['client_province']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
  ]

  /* 4.2 省内各地区流量分布 */
  // sql-44（域外访问域内）
  var top10CityOutToInTraffic = [
	<#if r44??>
		<#list r44 as d>	{client_region:'${d['client_region']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},egress_bytes:${((d['egress_bytes']?eval)/1024)?string("0.####")},ingress_bytes:${((d['ingress_bytes']?eval)/1024)?string("0.####")},egress_rate_avg:'${d['egress_rate_avg']}',egress_rate_max:'${d['egress_rate_max']}',egress_rate_min:'${d['egress_rate_min']}',ingress_rate_avg:'${d['ingress_rate_avg']}',ingress_rate_max:'${d['ingress_rate_max']}',ingress_rate_min:'${d['ingress_rate_min']}'},
		</#list>
	</#if>
  ]
  // sql-45
  var prevTop10CityOutToInTraffic = [
	<#if r45??>
		<#list r45 as d>	{client_region:'${d['client_region']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},egress_bytes:${((d['egress_bytes']?eval)/1024)?string("0.####")},ingress_bytes:${((d['ingress_bytes']?eval)/1024)?string("0.####")},egress_rate_avg:'${d['egress_rate_avg']}',egress_rate_max:'${d['egress_rate_max']}',egress_rate_min:'${d['egress_rate_min']}',ingress_rate_avg:'${d['ingress_rate_avg']}',ingress_rate_max:'${d['ingress_rate_max']}',ingress_rate_min:'${d['ingress_rate_min']}'},
		</#list>
	</#if>
  ]
  // sql-46（域内访问域外）
  var top10CityInToOutTraffic = [
	<#if r46??>
		<#list r46 as d>	{server_region:'${d['server_region']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},egress_bytes:${((d['egress_bytes']?eval)/1024)?string("0.####")},ingress_bytes:${((d['ingress_bytes']?eval)/1024)?string("0.####")},egress_rate_avg:'${d['egress_rate_avg']}',egress_rate_max:'${d['egress_rate_max']}',egress_rate_min:'${d['egress_rate_min']}',ingress_rate_avg:'${d['ingress_rate_avg']}',ingress_rate_max:'${d['ingress_rate_max']}',ingress_rate_min:'${d['ingress_rate_min']}'},
		</#list>
	</#if>
  ]
  // sql-47
  var prevTop10CityInToOutTraffic = [
	<#if r47??>
		<#list r47 as d>	{server_region:'${d['server_region']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},egress_bytes:${((d['egress_bytes']?eval)/1024)?string("0.####")},ingress_bytes:${((d['ingress_bytes']?eval)/1024)?string("0.####")},egress_rate_avg:'${d['egress_rate_avg']}',egress_rate_max:'${d['egress_rate_max']}',egress_rate_min:'${d['egress_rate_min']}',ingress_rate_avg:'${d['ingress_rate_avg']}',ingress_rate_max:'${d['ingress_rate_max']}',ingress_rate_min:'${d['ingress_rate_min']}'},
		</#list>
	</#if>
  ]
  /* 4.2 top3地区访问的主要app流量 */
  // sql-48
  var totalTop3CityTraffic = [
	<#if r48??>
		<#list r48 as d>	
			{client_region:'${d['client_region']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},},
		</#list>
	</#if>
  ]
  // sql-49
  var prevTotalTop3CityTraffic = [
    <#if r49??>
		<#list r49 as d>	
			{client_region:'${d['client_region']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},},
		</#list>
	</#if>
  ]
  // sql-50 52 54
  var top3CityAppTraffic = [
	<#if r50??>
		<#list r50 as d>	{client_region:'${d['client_region']}',app_company:'${d['app_company']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
    <#if r52??>
		<#list r52 as d>	{client_region:'${d['client_region']}',app_company:'${d['app_company']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
	<#if r54??>
		<#list r54 as d>	{client_region:'${d['client_region']}',app_company:'${d['app_company']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
  ]
  // sql-51 53 55
  var prevTop3CityAppTraffic = [
	<#if r51??>
		<#list r51 as d>	{client_region:'${d['client_region']}',app_company:'${d['app_company']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
    <#if r53??>
		<#list r53 as d>	{client_region:'${d['client_region']}',app_company:'${d['app_company']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
	<#if r55??>
		<#list r55 as d>	{client_region:'${d['client_region']}',app_company:'${d['app_company']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
  ]
  /* 4.2 访问域内top3 app各地区流量 */
  // sql-56
  var totalTop3AppCityTraffic = [
	<#if r56??>
		<#list r56 as d>	
			{app_company:'${d['app_company']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},},
		</#list>
	</#if>
  ]
  // sql-57
  var prevTotalTop3AppCityTraffic = [
    <#if r57??>
		<#list r57 as d>	
			{app_company:'${d['app_company']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},},
		</#list>
	</#if>
  ]
  // sql-58 60 62
  var top3AppCityTraffic = [
	<#if r58??>
		<#list r58 as d>	{app_company:'${d['app_company']}',client_region:'${d['client_region']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
    <#if r60??>
		<#list r60 as d>	{app_company:'${d['app_company']}',client_region:'${d['client_region']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
	<#if r62??>
		<#list r62 as d>	{app_company:'${d['app_company']}',client_region:'${d['client_region']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
  ]
  // sql-59 61 63
  var prevTop3AppCityTraffic = [
    <#if r59??>
		<#list r59 as d>	{app_company:'${d['app_company']}',client_region:'${d['client_region']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
    <#if r61??>
		<#list r61 as d>	{app_company:'${d['app_company']}',client_region:'${d['client_region']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
	<#if r63??>
		<#list r63 as d>	{app_company:'${d['app_company']}',client_region:'${d['client_region']}',bytes:${((d['bytes']?eval)/1024)?string("0.####")},rate50:'${d['rate50']}',rate90:'${d['rate90']}',rate99:'${d['rate99']}',rate_avg:'${d['rate_avg']}',rate_max:'${d['rate_max']}',rate_min:'${d['rate_min']}'},
		</#list>
	</#if>
  ]

  /* 5. IDC租用方内容收敛情况 */
  // sql-64 Top3 S2C总流量
  var top3S2cTotalTraffic = [
	<#if r64??>
		<#list r64 as d>	
			{received_bytes:${((d['received_bytes']?eval)/1024)?string("0.####")},server_idc_renter:'${d['server_idc_renter']}',},
		</#list>
	</#if>
  ]
  // sql-65 未命中缓存S2C流量
  var missedCacheS2cTraffic = [
	<#if r65??>
		<#list r65 as d>	
			{received_bytes:${((d['received_bytes']?eval)/1024)?string("0.####")},client_idc_renter:'${d['client_idc_renter']}',},
		</#list>
	</#if>
  ]
  // sql-66 Top3 会话总数
  var top3Sessions = [
	<#if r66??>
		<#list r66 as d>	
			{sessions:${d['sessions']},server_idc_renter:'${d['server_idc_renter']}',},
		</#list>
	</#if>
  ]
  // sql-67 未命中缓存的会话
  var missedCacheSession = [
	<#if r67??>
		<#list r67 as d>	
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
    var currentRange5 = document.getElementById('currentRange5')
    var prevRange5 = document.getElementById('prevRange5')
    var currentRange6 = document.getElementById('currentRange6')
    var prevRange6 = document.getElementById('prevRange6')
    var currentRange9 = document.getElementById('currentRange9')
    var prevRange9 = document.getElementById('prevRange9')
    var currentRange10 = document.getElementById('currentRange10')
    var prevRange10 = document.getElementById('prevRange10')
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
    currentRange5.innerText = currentRangeStr
    prevRange5.innerText = prevRangeStr
    currentRange6.innerText = currentRangeStr
    prevRange6.innerText = prevRangeStr
    currentRange9.innerText = currentRangeStr
    prevRange9.innerText = prevRangeStr
    currentRange10.innerText = currentRangeStr
    prevRange10.innerText = prevRangeStr
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
            lte: quantile1.p50,
            color: 'rgb(251,219,15)'
          },
          {
            gt: quantile1.p50,
            lte: quantile1.p90,
            color: 'rgb(252,125,2)'
          },
          {
            gt: quantile1.p90,
            lte: quantile1.p99,
            color: 'rgb(253,1,0)'
          },
          {
            gt: quantile1.p99,
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
              yAxis: quantile1.p50
            },
            {
              yAxis: quantile1.p90
            },
            {
              yAxis: quantile1.p99
            }
          ]
        }
      }
    }
    myChart.setOption(option)
    document.getElementById('imgCanvas1').src = myChart.getDataURL({pixelRatio: 1})
  }

  // 业务流量排名折线图
  var unit2 = 'KB'
  var categoryData2 = overallAppTraffic.map(t => t.app_company)
  var barSeriesData2 = overallAppTraffic.map(t => ({ value: t.bytes, percent: totalTraffic === 0 ? 0 : t.bytes / totalTraffic }))
  var copyBarSeriesData2 = [...barSeriesData2]
  var lineSeriesData2 = overallAppTraffic.map(t => {
    var findData = prevOverallAppTraffic.find(pt => pt.app_company === t.app_company)
    if (findData) {
      return parseFloat(((t.bytes - findData.bytes) / parseFloat(findData.bytes) * 100).toFixed(2))
    } else {
      return 0
    }
  })
  var copyLineSeriesData2 = [...lineSeriesData2]
  copyLineSeriesData2.sort((a, b) => a - b)
  copyBarSeriesData2.sort((a, b) => a.value - b.value)
  var barMax2 = copyBarSeriesData2.length > 0 ? copyBarSeriesData2[copyBarSeriesData2.length - 1].value : 50
  var lineMin2 = copyLineSeriesData2[0] ? copyLineSeriesData2[0] : 0
  var lineMax2 = copyLineSeriesData2.length > 0 ? copyLineSeriesData2[copyLineSeriesData2.length - 1] : 0
  if (lineMin2 == 0 && lineMin2 == lineMax2) {
    lineMin2 = -4
    lineMax2 = 1
  } else {
    var tempLineMin2 = lineMin2
    lineMin2 = lineMin2 - 2 * (lineMax2 - lineMin2)
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
          name: '流量',
          data: barSeriesData2,
          type: 'bar',
          barMinHeight: 5,
          barWidth: 40,
          label: {
            show: true,
            formatter: function (param) {
              return unitConvert(param.value, unitTypes.byte, unit2).join('') + '\n' + unitConvert(param.data.percent, unitTypes.percent).join('')
            },
            color: 'rgb(59,162,201)',
            textBorderColor: 'white',
            textBorderWidth: 3,
            position: 'top'
          },
          itemStyle: {
            color: 'rgb(59,162,201)'
          }
        },
        {
          yAxisIndex: 1,
          name: '环比',
          data: lineSeriesData2,
          type: 'line',
          label: {
            show: true,
            formatter: function (param) {
              return param.value.toFixed(2) + '%'
            },
            textBorderColor: 'white',
            textBorderWidth: 3,
            color: 'rgb(99,182,172)'
          },
          lineStyle: {
            type: 'dashed'
          },
          itemStyle: {
            color: 'rgb(99,182,172)'
          }
        }
      ]
    }
    myChart.setOption(option)
    document.getElementById('imgCanvas2').src = myChart.getDataURL({pixelRatio: 1})
  }

  //  域外访问域内服务的Top 10省份流量分布折线图
  var unit3 = 'KB'
  var categoryData3 = top10ProvinceOutToInTraffic.map(t => t.client_province)
  var barSeriesDataUp3 = top10ProvinceOutToInTraffic.map(t => ({ value: t.egress_bytes, percent: outToInEgressTraffic === 0 ? 0 : parseFloat(t.egress_bytes) / outToInEgressTraffic }))
  var lineSeriesDataUp3 = top10ProvinceOutToInTraffic.map(t => {
    var findData = prevTop10ProvinceOutToInTraffic.find(pt => pt.client_province === t.client_province)
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

  //  域外访问域内服务的Top 10省份流量分布折线图
  var unit25 = 'KB'
  var categoryData25 = top10ProvinceOutToInTraffic.map(t => t.client_province)
  var barSeriesDataDown25 = top10ProvinceOutToInTraffic.map(t => ({ value: t.ingress_bytes, percent: outToInIngressTraffic === 0 ? 0 : parseFloat(t.ingress_bytes) / outToInIngressTraffic }))
  var lineSeriesDataDown25 = top10ProvinceOutToInTraffic.map(t => {
    var findData = prevTop10ProvinceOutToInTraffic.find(pt => pt.client_province === t.client_province)
    if (findData) {
      return findData.ingress_bytes === 0 ? 0.00 : parseFloat(((t.ingress_bytes - findData.ingress_bytes) / parseFloat(findData.ingress_bytes) * 100).toFixed(2))
    } else {
      return 0
    }
  })
  var copyLineSeriesData25 = [...lineSeriesDataDown25]
  var copyBarSeriesData25 = [...barSeriesDataDown25]
  copyLineSeriesData25.sort((a, b) => a - b)
  copyBarSeriesData25.sort((a, b) => a.value - b.value)
  var barMax25 = copyBarSeriesData25.length > 0 ? copyBarSeriesData25[copyBarSeriesData25.length - 1].value : 50
  var lineMin25 = copyLineSeriesData25[0] ? copyLineSeriesData25[0] : 0
  var lineMax25 = copyLineSeriesData25.length > 0 ? copyLineSeriesData25[copyLineSeriesData25.length - 1] : 0
  if (lineMin25 == 0 && lineMin25 == lineMax25) {
    lineMin25 = -5
    lineMax25 = 1
  } else {
    var tempLineMin25 = lineMin25
    lineMin25 = lineMin25 - 2.5 * (lineMax25 - lineMin25)
    lineMax25 = lineMax25 + 0.5 * (lineMax25 - tempLineMin25)
  }
  function initEcharts25 () {
    var myChart = echarts.init(document.getElementById('canvas25'))
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
        data: categoryData25,
        axisLabel: {
          interval: 0,
          fontSize: 12
        }
      },
      yAxis: [
        {
          name: '流量',
          max: barMax25 * 2,
          nameTextStyle: {
            color: 'transparent'
          },
          type: 'value',
          axisLabel: {
            formatter (value) {
              return unitConvert(value, unitTypes.byte, unit25).join('')
            }
          }
        },
        {
          show: false,
          name: '环比',
          type: 'value',
          min: lineMin25,
          max: lineMax25
        }
      ],
      series: [
        {
          name: '下行流量',
          data: barSeriesDataDown25,
          barMinHeight: 5,
          type: 'bar',
          barWidth: 40,
          label: {
            show: true,
            formatter: function (param) {
              return unitConvert(param.value, unitTypes.byte, unit25).join('') + '\n' + unitConvert(param.data.percent, unitTypes.percent).join('')
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
          data: lineSeriesDataDown25,
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
    document.getElementById('imgCanvas25').src = myChart.getDataURL({pixelRatio: 1})
  }

  //  域内访问域外服务的Top 10省份流量分布折线图
  var unit17 = 'KB'
  var categoryData17 = top10ProvinceInToOutTraffic.map(t => t.server_province)
  var barSeriesDataUp17 = top10ProvinceInToOutTraffic.map(t => ({ value: t.egress_bytes, percent: inToOutEgressTraffic === 0 ? 0 : parseFloat(t.egress_bytes) / inToOutEgressTraffic }))
  var lineSeriesDataUp17 = top10ProvinceInToOutTraffic.map(t => {
    var findData = prevTop10ProvinceInToOutTraffic.find(pt => pt.server_province === t.server_province)
    if (findData) {
      return findData.egress_bytes === 0 ? 0 : parseFloat(((t.egress_bytes - findData.egress_bytes) / parseFloat(findData.egress_bytes) * 100).toFixed(2))
    } else {
      return 0
    }
  })
  var copyLineSeriesData17 = [...lineSeriesDataUp17]
  var copyBarSeriesData17 = [...barSeriesDataUp17]
  copyLineSeriesData17.sort((a, b) => a - b)
  copyBarSeriesData17.sort((a, b) => a.value - b.value)
  var barMax17 = copyBarSeriesData17.length > 0 ? copyBarSeriesData17[copyBarSeriesData17.length - 1].value : 50
  var lineMin17 = copyLineSeriesData17[0] ? copyLineSeriesData17[0] : 0
  var lineMax17 = copyLineSeriesData17.length > 0 ? copyLineSeriesData17[copyLineSeriesData17.length - 1] : 0
  if (lineMin17 == 0 && lineMin17 == lineMax17) {
    lineMin17 = -5
    lineMax17 = 1
  } else {
    var tempLineMin17 = lineMin17
    lineMin17 = lineMin17 - 2.5 * (lineMax17 - lineMin17)
    lineMax17 = lineMax17 + 0.5 * (lineMax17 - tempLineMin17)
  }
  function initEcharts17 () {
    var myChart = echarts.init(document.getElementById('canvas17'))
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
        data: categoryData17,
        axisLabel: {
          interval: 0,
          fontSize: 12
        }
      },
      yAxis: [
        {
          name: '流量',
          max: barMax17 * 2,
          nameTextStyle: {
            color: 'transparent'
          },
          type: 'value',
          axisLabel: {
            formatter (value) {
              return unitConvert(value, unitTypes.byte, unit17).join('')
            }
          }
        },
        {
          show: false,
          name: '环比',
          type: 'value',
          min: lineMin17,
          max: lineMax17
        }
      ],
      series: [
        {
          name: '上行流量',
          data: barSeriesDataUp17,
          barMinHeight: 5,
          type: 'bar',
          barWidth: 40,
          label: {
            show: true,
            formatter: function (param) {
              return unitConvert(param.value, unitTypes.byte, unit17).join('') + '\n' + unitConvert(param.data.percent, unitTypes.percent).join('')
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
          data: lineSeriesDataUp17,
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
    document.getElementById('imgCanvas17').src = myChart.getDataURL({pixelRatio: 1})
  }

  //  域内访问域外服务的Top 10省份流量分布折线图
  var unit26 = 'KB'
  var categoryData26 = top10ProvinceInToOutTraffic.map(t => t.server_province)
  var barSeriesDataDown26 = top10ProvinceInToOutTraffic.map(t => ({ value: t.ingress_bytes, percent: inToOutIngressTraffic === 0 ? 0 : parseFloat(t.ingress_bytes) / inToOutIngressTraffic }))
  var lineSeriesDataDown26 = top10ProvinceInToOutTraffic.map(t => {
    var findData = prevTop10ProvinceInToOutTraffic.find(pt => pt.server_province === t.server_province)
    if (findData) {
      return findData.ingress_bytes === 0 ? 0.00 : parseFloat(((t.ingress_bytes - findData.ingress_bytes) / parseFloat(findData.ingress_bytes) * 100).toFixed(2))
    } else {
      return 0
    }
  })
  var copyLineSeriesData26 = [...lineSeriesDataDown26]
  var copyBarSeriesData26 = [...barSeriesDataDown26]
  copyLineSeriesData26.sort((a, b) => a - b)
  copyBarSeriesData26.sort((a, b) => a.value - b.value)
  var barMax26 = copyBarSeriesData26.length > 0 ? copyBarSeriesData26[copyBarSeriesData26.length - 1].value : 50
  var lineMin26 = copyLineSeriesData26[0] ? copyLineSeriesData26[0] : 0
  var lineMax26 = copyLineSeriesData26.length > 0 ? copyLineSeriesData26[copyLineSeriesData26.length - 1] : 0
  if (lineMin26 == 0 && lineMin26 == lineMax26) {
    lineMin26 = -5
    lineMax26 = 1
  } else {
    var tempLineMin26 = lineMin26
    lineMin26 = lineMin26 - 2.5 * (lineMax26 - lineMin26)
    lineMax26 = lineMax26 + 0.5 * (lineMax26 - tempLineMin26)
  }
  function initEcharts26 () {
    var myChart = echarts.init(document.getElementById('canvas26'))
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
        data: categoryData26,
        axisLabel: {
          interval: 0,
          fontSize: 12
        }
      },
      yAxis: [
        {
          name: '流量',
          max: barMax26 * 2,
          nameTextStyle: {
            color: 'transparent'
          },
          type: 'value',
          axisLabel: {
            formatter (value) {
              return unitConvert(value, unitTypes.byte, unit26).join('')
            }
          }
        },
        {
          show: false,
          name: '环比',
          type: 'value',
          min: lineMin26,
          max: lineMax26
        }
      ],
      series: [
        {
          name: '下行流量',
          data: barSeriesDataDown26,
          barMinHeight: 5,
          type: 'bar',
          barWidth: 40,
          label: {
            show: true,
            formatter: function (param) {
              return unitConvert(param.value, unitTypes.byte, unit26).join('') + '\n' + unitConvert(param.data.percent, unitTypes.percent).join('')
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
          data: lineSeriesDataDown26,
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
    document.getElementById('imgCanvas26').src = myChart.getDataURL({pixelRatio: 1})
  }

  var unit4 = 'KB'
  var province4 = totalTop3ProvinceTraffic[0]
  var categoryData4 = []
  var seriesData4 = []
  var prevSeriesData4 = []
  if (province4) {
    var prevProvince4 = prevTotalTop3ProvinceTraffic.find(t => t.client_province === province4.client_province)
    top3ProvinceAppTraffic.forEach(d => {
      if (d.client_province === province4.client_province) {
        categoryData4.push(d.app_company)
        seriesData4.push(d.bytes / province4.bytes)
        var prevApp = prevTop3ProvinceAppTraffic.find(p => p.app_company === d.app_company && p.client_province === d.client_province)
        if (prevApp) {
          prevSeriesData4.push(prevApp.bytes / prevProvince4.bytes)
        } else {
          prevSeriesData4.push(0)
        }
      }
    })
  }
  function initEcharts4 () {
    var myChart = echarts.init(document.getElementById('canvas4'))
    var option = {
      animation: false,
      color: [chartColor[1], chartColor[6]],
      grid: {
        top: 30,
        bottom: 35,
        right: 20,
        left: 70
      },
      xAxis: {
        type: 'category',
        data: categoryData4,
        axisLabel: {
          interval: 0,
          rotate: 20,
          fontSize: 12
        }
      },
      yAxis: {
        type: 'value',
        axisLabel: {
          formatter (value) {
            return unitConvert(value, unitTypes.percent).join('')
          }
        }
      },
      series: [
        {
          data: seriesData4,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        },
        {
          data: prevSeriesData4,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        }
      ]
    }
    myChart.setOption(option)
    document.getElementById('imgCanvas4').src = myChart.getDataURL({pixelRatio: 1})
  }

  var province5 = totalTop3ProvinceTraffic[1]
  var categoryData5 = []
  var seriesData5 = []
  var prevSeriesData5 = []
  if (province5) {
    var prevProvince5 = prevTotalTop3ProvinceTraffic.find(t => t.client_province === province5.client_province)
    top3ProvinceAppTraffic.forEach(d => {
      if (d.client_province === province5.client_province) {
        categoryData5.push(d.app_company)
        seriesData5.push(d.bytes / province5.bytes)
        var prevApp = prevTop3ProvinceAppTraffic.find(p => p.app_company === d.app_company && p.client_province === d.client_province)
        if (prevApp) {
          prevSeriesData5.push(prevApp.bytes / prevProvince5.bytes)
        } else {
          prevSeriesData5.push(0)
        }
      }
    })
  }
  function initEcharts5 () {
    var myChart = echarts.init(document.getElementById('canvas5'))
    var option = {
      animation: false,
      color: [chartColor[1], chartColor[6]],
      grid: {
        top: 30,
        bottom: 35,
        right: 20,
        left: 70
      },
      xAxis: {
        type: 'category',
        data: categoryData5,
        axisLabel: {
          interval: 0,
          rotate: 20,
          fontSize: 12
        }
      },
      yAxis: {
        type: 'value',
        axisLabel: {
          formatter (value) {
            return unitConvert(value, unitTypes.percent).join('')
          }
        }
      },
      series: [
        {
          data: seriesData5,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        },
        {
          data: prevSeriesData5,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        }
      ]
    }
    myChart.setOption(option)
    document.getElementById('imgCanvas5').src = myChart.getDataURL({pixelRatio: 1})
  }

  var province6 = totalTop3ProvinceTraffic[2]
  var categoryData6 = []
  var seriesData6 = []
  var prevSeriesData6 = []
  if (province6) {
    var prevProvince6 = prevTotalTop3ProvinceTraffic.find(t => t.client_province === province6.client_province)
    top3ProvinceAppTraffic.forEach(d => {
      if (d.client_province === province6.client_province) {
        categoryData6.push(d.app_company)
        seriesData6.push(d.bytes / province6.bytes)
        var prevApp = prevTop3ProvinceAppTraffic.find(p => p.app_company === d.app_company && p.client_province === d.client_province)
        if (prevApp) {
          prevSeriesData6.push(prevApp.bytes / prevProvince6.bytes)
        } else {
          prevSeriesData6.push(0)
        }
      }
    })
  }
  function initEcharts6 () {
    var myChart = echarts.init(document.getElementById('canvas6'))
    var option = {
      animation: false,
      color: [chartColor[1], chartColor[6]],
      grid: {
        top: 30,
        bottom: 35,
        right: 20,
        left: 70
      },
      xAxis: {
        type: 'category',
        data: categoryData6,
        axisLabel: {
          interval: 0,
          rotate: 20,
          fontSize: 12
        }
      },
      yAxis: {
        type: 'value',
        axisLabel: {
          formatter (value) {
            return unitConvert(value, unitTypes.percent).join('')
          }
        }
      },
      series: [
        {
          data: seriesData6,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        },
        {
          data: prevSeriesData6,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        }
      ]
    }
    myChart.setOption(option)
    document.getElementById('imgCanvas6').src = myChart.getDataURL({pixelRatio: 1})
  }

  var app7 = totalTop3AppProvinceTraffic[0]
  var categoryData7 = []
  var seriesData7 = []
  var prevSeriesData7 = []
  if (app7) {
    var prevApp7 = prevTotalTop3AppProvinceTraffic.find(t => t.app_company === app7.app_company)
    top3AppProvinceTraffic.forEach(d => {
      if (d.app_company === app7.app_company) {
        categoryData7.push(d.client_province)
        seriesData7.push(d.bytes / app7.bytes)
        var prevApp = prevTop3AppProvinceTraffic.find(p => p.client_province === d.client_province && p.app_company === d.app_company)
        if (prevApp) {
          prevSeriesData7.push(prevApp.bytes / prevApp7.bytes)
        } else {
          prevSeriesData7.push(0)
        }
      }
    })
  }
  function initEcharts7 () {
    var myChart = echarts.init(document.getElementById('canvas7'))
    var option = {
      animation: false,
      color: [chartColor[1], chartColor[6]],
      grid: {
        top: 30,
        bottom: 35,
        right: 20,
        left: 70
      },
      xAxis: {
        type: 'category',
        data: categoryData7,
        axisLabel: {
          interval: 0,
          rotate: 20,
          fontSize: 12
        }
      },
      yAxis: {
        type: 'value',
        axisLabel: {
          formatter (value) {
            return unitConvert(value, unitTypes.percent).join('')
          }
        }
      },
      series: [
        {
          data: seriesData7,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        },
        {
          data: prevSeriesData7,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        }
      ]
    }
    myChart.setOption(option)
    document.getElementById('imgCanvas7').src = myChart.getDataURL({pixelRatio: 1})
  }

  var app8 = totalTop3AppProvinceTraffic[1]
  var categoryData8 = []
  var seriesData8 = []
  var prevSeriesData8 = []
  if (app8) {
    var prevApp8 = prevTotalTop3AppProvinceTraffic.find(t => t.app_company === app8.app_company)
    top3AppProvinceTraffic.forEach(d => {
      if (d.app_company === app8.app_company) {
        categoryData8.push(d.client_province)
        seriesData8.push(d.bytes / app8.bytes)
        var prevApp = prevTop3AppProvinceTraffic.find(p => p.app_company === d.app_company && p.client_province === d.client_province)
        if (prevApp) {
          prevSeriesData8.push(prevApp.bytes / prevApp8.bytes)
        } else {
          prevSeriesData8.push(0)
        }
      }
    })
  }
  function initEcharts8 () {
    var myChart = echarts.init(document.getElementById('canvas8'))
    var option = {
      animation: false,
      color: [chartColor[1], chartColor[6]],
      grid: {
        top: 30,
        bottom: 35,
        right: 20,
        left: 70
      },
      xAxis: {
        type: 'category',
        data: categoryData8,
        axisLabel: {
          interval: 0,
          rotate: 20,
          fontSize: 12
        }
      },
      yAxis: {
        type: 'value',
        axisLabel: {
          formatter (value) {
            return unitConvert(value, unitTypes.percent).join('')
          }
        }
      },
      series: [
        {
          data: seriesData8,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        },
        {
          data: prevSeriesData8,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        }
      ]
    }
    myChart.setOption(option)
    document.getElementById('imgCanvas8').src = myChart.getDataURL({pixelRatio: 1})
  }

  var app9 = totalTop3AppProvinceTraffic[2]
  var categoryData9 = []
  var seriesData9 = []
  var prevSeriesData9 = []
  if (app9) {
    var prevApp9 = prevTotalTop3AppProvinceTraffic.find(t => t.app_company === app9.app_company)
    top3AppProvinceTraffic.forEach(d => {
      if (d.app_company === app9.app_company) {
        categoryData9.push(d.client_province)
        seriesData9.push(d.bytes / app9.bytes)
        var prevApp = prevTop3AppProvinceTraffic.find(p => p.app_company === d.app_company && p.client_province === d.client_province)
        if (prevApp) {
          prevSeriesData9.push(prevApp.bytes / prevApp9.bytes)
        } else {
          prevSeriesData9.push(0)
        }
      }
    })
  }
  function initEcharts9 () {
    var myChart = echarts.init(document.getElementById('canvas9'))
    var option = {
      animation: false,
      color: [chartColor[1], chartColor[6]],
      grid: {
        top: 30,
        bottom: 35,
        right: 20,
        left: 70
      },
      xAxis: {
        type: 'category',
        data: categoryData9,
        axisLabel: {
          interval: 0,
          rotate: 20,
          fontSize: 12
        }
      },
      yAxis: {
        type: 'value',
        axisLabel: {
          formatter (value) {
            return unitConvert(value, unitTypes.percent).join('')
          }
        }
      },
      series: [
        {
          data: seriesData9,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        },
        {
          data: prevSeriesData9,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        }
      ]
    }
    myChart.setOption(option)
    document.getElementById('imgCanvas9').src = myChart.getDataURL({pixelRatio: 1})
  }

  // 域外访问域内服务的Top 10省内地区流量分布折线图
  var unit10 = 'KB'
  var categoryData10 = top10CityOutToInTraffic.map(t => t.client_region)
  var barSeriesDataUp10 = top10CityOutToInTraffic.map(t => ({ value: t.egress_bytes, percent: outToInRegionEgressTraffic === 0 ? 0 : parseFloat(t.egress_bytes) / outToInRegionEgressTraffic }))
  var lineSeriesDataUp10 = top10CityOutToInTraffic.map(t => {
    var findData = prevTop10CityOutToInTraffic.find(pt => pt.client_region === t.client_region)
    if (findData) {
      return findData.egress_bytes === 0 ? 0 : parseFloat(((t.egress_bytes - findData.egress_bytes) / parseFloat(findData.egress_bytes) * 100).toFixed(2))
    } else {
      return 0
    }
  })
  var copyLineSeriesData10 = [...lineSeriesDataUp10]
  var copyBarSeriesData10 = [...barSeriesDataUp10]
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
          name: '上行流量',
          barMinHeight: 5,
          data: barSeriesDataUp10,
          type: 'bar',
          barWidth: 40,
          label: {
            show: true,
            formatter: function (param) {
              return unitConvert(param.value, unitTypes.byte, unit10).join('') + '\n' + unitConvert(param.data.percent, unitTypes.percent).join('')
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
          data: lineSeriesDataUp10,
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
    document.getElementById('imgCanvas10').src = myChart.getDataURL({pixelRatio: 1})
  }

  // 域外访问域内服务的Top 10省内地区流量分布折线图
  var unit27 = 'KB'
  var categoryData27 = top10CityOutToInTraffic.map(t => t.client_region)
  var barSeriesDataDown27 = top10CityOutToInTraffic.map(t => ({ value: t.ingress_bytes, percent: outToInRegionIngressTraffic === 0 ? 0 : parseFloat(t.ingress_bytes) / outToInRegionIngressTraffic }))
  var lineSeriesDataDown27 = top10CityOutToInTraffic.map(t => {
    var findData = prevTop10CityOutToInTraffic.find(pt => pt.client_region === t.client_region)
    if (findData) {
      return findData.ingress_bytes === 0 ? 0 : parseFloat(((t.ingress_bytes - findData.ingress_bytes) / parseFloat(findData.ingress_bytes) * 100).toFixed(2))
    } else {
      return 0
    }
  })
  var copyLineSeriesData27 = [...lineSeriesDataDown27]
  var copyBarSeriesData27 = [...barSeriesDataDown27]
  copyLineSeriesData27.sort((a, b) => a - b)
  copyBarSeriesData27.sort((a, b) => a.value - b.value)
  var barMax27 = copyBarSeriesData27.length > 0 ? copyBarSeriesData27[copyBarSeriesData27.length - 1].value : 50
  var lineMin27 = copyLineSeriesData27[0] ? copyLineSeriesData27[0] : 0
  var lineMax27 = copyLineSeriesData27.length > 0 ? copyLineSeriesData27[copyLineSeriesData27.length - 1] : 0
  if (lineMin27 == 0 && lineMin27 == lineMax27) {
    lineMin27 = -5
    lineMax27 = 1
  } else {
    var tempLineMin27 = lineMin27
    lineMin27 = lineMin27 - 2.5 * (lineMax27 - lineMin27)
    lineMax27 = lineMax27 + 0.5 * (lineMax27 - tempLineMin27)
  }
  function initEcharts27 () {
    var myChart = echarts.init(document.getElementById('canvas27'))
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
        data: categoryData27,
        axisLabel: {
          interval: 0,
          fontSize: 12
        }
      },
      yAxis: [
        {
          name: '流量',
          max: barMax27 * 2,
          nameTextStyle: {
            color: 'transparent'
          },
          type: 'value',
          axisLabel: {
            formatter (value) {
              return unitConvert(value, unitTypes.byte, unit27).join('')
            }
          }
        },
        {
          show: false,
          name: '环比',
          type: 'value',
          min: lineMin27,
          max: lineMax27
        }
      ],
      series: [
        {
          name: '下行流量',
          barMinHeight: 5,
          data: barSeriesDataDown27,
          type: 'bar',
          barWidth: 40,
          label: {
            show: true,
            formatter: function (param) {
              return unitConvert(param.value, unitTypes.byte, unit27).join('') + '\n' + unitConvert(param.data.percent, unitTypes.percent).join('')
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
          data: lineSeriesDataDown27,
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
    document.getElementById('imgCanvas27').src = myChart.getDataURL({pixelRatio: 1})
  }

  // 域内访问域外服务的TOP 10省内地区流量分布折线图
  var unit18 = 'KB'
  var categoryData18 = top10CityInToOutTraffic.map(t => t.server_region)
  var barSeriesDataUp18 = top10CityInToOutTraffic.map(t => ({ value: t.egress_bytes, percent: inToOutRegionEgressTraffic === 0 ? 0 : parseFloat(t.egress_bytes) / inToOutRegionEgressTraffic }))
  var lineSeriesDataUp18 = top10CityInToOutTraffic.map(t => {
    var findData = prevTop10CityInToOutTraffic.find(pt => pt.server_region === t.server_region)
    if (findData) {
      return findData.egress_bytes === 0 ? 0 : parseFloat(((t.egress_bytes - findData.egress_bytes) / parseFloat(findData.egress_bytes) * 100).toFixed(2))
    } else {
      return 0
    }
  })
  var copyLineSeriesData18 = [...lineSeriesDataUp18]
  var copyBarSeriesData18 = [...barSeriesDataUp18]
  copyLineSeriesData18.sort((a, b) => a - b)
  copyBarSeriesData18.sort((a, b) => a.value - b.value)
  var barMax18 = copyBarSeriesData18.length > 0 ? copyBarSeriesData18[copyBarSeriesData18.length - 1].value : 50
  var lineMin18 = copyLineSeriesData18[0] ? copyLineSeriesData18[0] : 0
  var lineMax18 = copyLineSeriesData18.length > 0 ? copyLineSeriesData18[copyLineSeriesData18.length - 1] : 0
  if (lineMin18 == 0 && lineMin18 == lineMax18) {
    lineMin18 = -5
    lineMax18 = 1
  } else {
    var tempLineMin18 = lineMin18
    lineMin18 = lineMin18 - 2.5 * (lineMax18 - lineMin18)
    lineMax18 = lineMax18 + 0.5 * (lineMax18 - tempLineMin18)
  }
  function initEcharts18 () {
    var myChart = echarts.init(document.getElementById('canvas18'))
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
        data: categoryData18,
        axisLabel: {
          interval: 0,
          fontSize: 12
        }
      },
      yAxis: [
        {
          name: '流量',
          max: barMax18 * 2,
          nameTextStyle: {
            color: 'transparent'
          },
          type: 'value',
          axisLabel: {
            formatter (value) {
              return unitConvert(value, unitTypes.byte, unit18).join('')
            }
          }
        },
        {
          show: false,
          name: '环比',
          type: 'value',
          min: lineMin18,
          max: lineMax18
        }
      ],
      series: [
        {
          name: '上行流量',
          barMinHeight: 5,
          data: barSeriesDataUp18,
          type: 'bar',
          barWidth: 40,
          label: {
            show: true,
            formatter: function (param) {
              return unitConvert(param.value, unitTypes.byte, unit18).join('') + '\n' + unitConvert(param.data.percent, unitTypes.percent).join('')
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
          data: lineSeriesDataUp18,
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
    document.getElementById('imgCanvas18').src = myChart.getDataURL({pixelRatio: 1})
  }

  // 域内访问域外服务的TOP 10省内地区流量分布折线图
  var unit28 = 'KB'
  var categoryData28 = top10CityInToOutTraffic.map(t => t.server_region)
  var barSeriesDataDown28 = top10CityInToOutTraffic.map(t => ({ value: t.ingress_bytes, percent: inToOutRegionIngressTraffic === 0 ? 0 : parseFloat(t.ingress_bytes) / inToOutRegionIngressTraffic }))
  var lineSeriesDataDown28 = top10CityInToOutTraffic.map(t => {
    var findData = prevTop10CityInToOutTraffic.find(pt => pt.server_region === t.server_region)
    if (findData) {
      return findData.ingress_bytes === 0 ? 0 : parseFloat(((t.ingress_bytes - findData.ingress_bytes) / parseFloat(findData.ingress_bytes) * 100).toFixed(2))
    } else {
      return 0
    }
  })
  var copyLineSeriesData28 = [...lineSeriesDataDown28]
  var copyBarSeriesData28 = [...barSeriesDataDown28]
  copyLineSeriesData28.sort((a, b) => a - b)
  copyBarSeriesData28.sort((a, b) => a.value - b.value)
  var barMax28 = copyBarSeriesData28.length > 0 ? copyBarSeriesData28[copyBarSeriesData28.length - 1].value : 50
  var lineMin28 = copyLineSeriesData28[0] ? copyLineSeriesData28[0] : 0
  var lineMax28 = copyLineSeriesData28.length > 0 ? copyLineSeriesData28[copyLineSeriesData28.length - 1] : 0
  if (lineMin28 == 0 && lineMin28 == lineMax28) {
    lineMin28 = -5
    lineMax28 = 1
  } else {
    var tempLineMin28 = lineMin28
    lineMin28 = lineMin28 - 2.5 * (lineMax28 - lineMin28)
    lineMax28 = lineMax28 + 0.5 * (lineMax28 - tempLineMin28)
  }
  console.info(lineSeriesDataDown28)
  console.info(lineMin28)
  console.info(lineMax28)
  function initEcharts28 () {
    var myChart = echarts.init(document.getElementById('canvas28'))
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
        data: categoryData28,
        axisLabel: {
          interval: 0,
          fontSize: 12
        }
      },
      yAxis: [
        {
          name: '流量',
          max: barMax28 * 2,
          nameTextStyle: {
            color: 'transparent'
          },
          type: 'value',
          axisLabel: {
            formatter (value) {
              return unitConvert(value, unitTypes.byte, unit28).join('')
            }
          }
        },
        {
          show: false,
          name: '环比',
          type: 'value',
          min: lineMin28,
          max: lineMax28
        }
      ],
      series: [
        {
          name: '下行流量',
          barMinHeight: 5,
          data: barSeriesDataDown28,
          type: 'bar',
          barWidth: 40,
          label: {
            show: true,
            formatter: function (param) {
              return unitConvert(param.value, unitTypes.byte, unit28).join('') + '\n' + unitConvert(param.data.percent, unitTypes.percent).join('')
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
          data: lineSeriesDataDown28,
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
    document.getElementById('imgCanvas28').src = myChart.getDataURL({pixelRatio: 1})
  }

  var city11 = totalTop3CityTraffic[0]
  var categoryData11 = []
  var seriesData11 = []
  var prevSeriesData11 = []
  if (city11) {
    var prevCity11 = prevTotalTop3CityTraffic.find(t => t.client_region === city11.client_region)
    top3CityAppTraffic.forEach(d => {
      if (d.client_region === city11.client_region) {
        categoryData11.push(d.app_company)
        seriesData11.push(d.bytes / city11.bytes)
        var prevApp = prevTop3CityAppTraffic.find(p => p.app_company === d.app_company && p.client_region === d.client_region)
        if (prevApp) {
          prevSeriesData11.push(prevApp.bytes / prevCity11.bytes)
        } else {
          prevSeriesData11.push(0)
        }
      }
    })
  }
  function initEcharts11 () {
    var myChart = echarts.init(document.getElementById('canvas11'))
    var option = {
      animation: false,
      color: [chartColor[1], chartColor[6]],
      grid: {
        top: 30,
        bottom: 35,
        right: 20,
        left: 70
      },
      xAxis: {
        type: 'category',
        data: categoryData11,
        axisLabel: {
          interval: 0,
          rotate: 20,
          fontSize: 12
        }
      },
      yAxis: {
        type: 'value',
        axisLabel: {
          formatter (value) {
            return unitConvert(value, unitTypes.percent).join('')
          }
        }
      },
      series: [
        {
          data: seriesData11,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        },
        {
          data: prevSeriesData11,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        }
      ]
    }
    myChart.setOption(option)
    document.getElementById('imgCanvas11').src = myChart.getDataURL({pixelRatio: 1})
  }

  var city12 = totalTop3CityTraffic[1]
  var categoryData12 = []
  var seriesData12 = []
  var prevSeriesData12 = []
  if (city12) {
    var prevCity12 = prevTotalTop3CityTraffic.find(t => t.client_region === city12.client_region)
    top3CityAppTraffic.forEach(d => {
      if (d.client_region === city12.client_region) {
        categoryData12.push(d.app_company)
        seriesData12.push(d.bytes / city12.bytes)
        var prevApp = prevTop3CityAppTraffic.find(p => p.app_company === d.app_company && p.client_region === d.client_region)
        if (prevApp) {
          prevSeriesData12.push(prevApp.bytes / prevCity12.bytes)
        } else {
          prevSeriesData12.push(0)
        }
      }
    })
  }
  function initEcharts12 () {
    var myChart = echarts.init(document.getElementById('canvas12'))
    var option = {
      animation: false,
      color: [chartColor[1], chartColor[6]],
      grid: {
        top: 30,
        bottom: 35,
        right: 20,
        left: 70
      },
      xAxis: {
        type: 'category',
        data: categoryData12,
        axisLabel: {
          interval: 0,
          rotate: 20,
          fontSize: 12
        }
      },
      yAxis: {
        type: 'value',
        axisLabel: {
          formatter (value) {
            return unitConvert(value, unitTypes.percent).join('')
          }
        }
      },
      series: [
        {
          data: seriesData12,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        },
        {
          data: prevSeriesData12,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        }
      ]
    }
    myChart.setOption(option)
    document.getElementById('imgCanvas12').src = myChart.getDataURL({pixelRatio: 1})
  }

  var city13 = totalTop3CityTraffic[2]
  var categoryData13 = []
  var seriesData13 = []
  var prevSeriesData13 = []
  if (city13) {
    var prevCity13 = prevTotalTop3CityTraffic.find(t => t.client_region === city13.client_region)
    top3CityAppTraffic.forEach(d => {
      if (d.client_region === city13.client_region) {
        categoryData13.push(d.app_company)
        seriesData13.push(d.bytes / city13.bytes)
        var prevApp = prevTop3CityAppTraffic.find(p => p.app_company === d.app_company && p.client_region === d.client_region)
        if (prevApp) {
          prevSeriesData13.push(prevApp.bytes / prevCity13.bytes)
        } else {
          prevSeriesData13.push(0)
        }
      }
    })
  }
  function initEcharts13 () {
    var myChart = echarts.init(document.getElementById('canvas13'))
    var option = {
      animation: false,
      color: [chartColor[1], chartColor[6]],
      grid: {
        top: 30,
        bottom: 35,
        right: 20,
        left: 70
      },
      xAxis: {
        type: 'category',
        data: categoryData13,
        axisLabel: {
          interval: 0,
          rotate: 20,
          fontSize: 12
        }
      },
      yAxis: {
        type: 'value',
        axisLabel: {
          formatter (value) {
            return unitConvert(value, unitTypes.percent).join('')
          }
        }
      },
      series: [
        {
          data: seriesData13,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        },
        {
          data: prevSeriesData13,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        }
      ]
    }
    myChart.setOption(option)
    document.getElementById('imgCanvas13').src = myChart.getDataURL({pixelRatio: 1})
  }


  var app14 = totalTop3AppCityTraffic[0]
  var categoryData14 = []
  var seriesData14 = []
  var prevSeriesData14 = []
  if (app14) {
    var prevApp14 = prevTotalTop3AppCityTraffic.find(t => t.app_company === app14.app_company)
    top3AppCityTraffic.forEach(d => {
      if (d.app_company === app14.app_company) {
        categoryData14.push(d.client_region)
        seriesData14.push(d.bytes / app14.bytes)
        var prevApp = prevTop3AppCityTraffic.find(p => p.app_company === d.app_company && p.client_region === d.client_region)
        if (prevApp) {
          prevSeriesData14.push(prevApp.bytes / prevApp14.bytes)
        } else {
          prevSeriesData14.push(0)
        }
      }
    })
  }
  function initEcharts14 () {
    var myChart = echarts.init(document.getElementById('canvas14'))
    var option = {
      animation: false,
      color: [chartColor[1], chartColor[6]],
      grid: {
        top: 30,
        bottom: 35,
        right: 20,
        left: 70
      },
      xAxis: {
        type: 'category',
        data: categoryData14,
        axisLabel: {
          interval: 0,
          rotate: 20,
          fontSize: 12
        }
      },
      yAxis: {
        type: 'value',
        axisLabel: {
          formatter (value) {
            return unitConvert(value, unitTypes.percent).join('')
          }
        }
      },
      series: [
        {
          data: seriesData14,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        },
        {
          data: prevSeriesData14,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        }
      ]
    }
    myChart.setOption(option)
    document.getElementById('imgCanvas14').src = myChart.getDataURL({pixelRatio: 1})
  }

  var app15 = totalTop3AppCityTraffic[1]
  var categoryData15 = []
  var seriesData15 = []
  var prevSeriesData15 = []
  if (app15) {
    var prevApp15 = prevTotalTop3AppCityTraffic.find(t => t.app_company === app15.app_company)
    top3AppCityTraffic.forEach(d => {
      if (d.app_company === app15.app_company) {
        categoryData15.push(d.client_region)
        seriesData15.push(d.bytes / app15.bytes)
        var prevApp = prevTop3AppCityTraffic.find(p => p.app_company === d.app_company && p.client_region === d.client_region)
        if (prevApp) {
          prevSeriesData15.push(prevApp.bytes / prevApp15.bytes)
        } else {
          prevSeriesData15.push(0)
        }
      }
    })
  }
  function initEcharts15 () {
    var myChart = echarts.init(document.getElementById('canvas15'))
    var option = {
      animation: false,
      color: [chartColor[1], chartColor[6]],
      grid: {
        top: 30,
        bottom: 35,
        right: 20,
        left: 70
      },
      xAxis: {
        type: 'category',
        data: categoryData15,
        axisLabel: {
          interval: 0,
          rotate: 20,
          fontSize: 12
        }
      },
      yAxis: {
        type: 'value',
        axisLabel: {
          formatter (value) {
            return unitConvert(value, unitTypes.percent).join('')
          }
        }
      },
      series: [
        {
          data: seriesData15,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        },
        {
          data: prevSeriesData15,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        }
      ]
    }
    myChart.setOption(option)
    document.getElementById('imgCanvas15').src = myChart.getDataURL({pixelRatio: 1})
  }

  var app16 = totalTop3AppCityTraffic[1]
  var categoryData16 = []
  var seriesData16 = []
  var prevSeriesData16 = []
  if (app16) {
    var prevApp16 = prevTotalTop3AppCityTraffic.find(t => t.app_company === app16.app_company)
    top3AppCityTraffic.forEach(d => {
      if (d.app_company === app16.app_company) {
        categoryData16.push(d.client_region)
        seriesData16.push(d.bytes / app16.bytes)
        var prevApp = prevTop3AppCityTraffic.find(p => p.app_company === d.app_company && p.client_region === d.client_region)
        if (prevApp) {
          prevSeriesData16.push(prevApp.bytes / prevApp16.bytes)
        } else {
          prevSeriesData16.push(0)
        }
      }
    })
  }
  function initEcharts16 () {
    var myChart = echarts.init(document.getElementById('canvas16'))
    var option = {
      animation: false,
      color: [chartColor[1], chartColor[6]],
      grid: {
        top: 30,
        bottom: 35,
        right: 20,
        left: 70
      },
      xAxis: {
        type: 'category',
        data: categoryData16,
        axisLabel: {
          interval: 0,
          rotate: 20,
          fontSize: 12
        }
      },
      yAxis: {
        type: 'value',
        axisLabel: {
          formatter (value) {
            return unitConvert(value, unitTypes.percent).join('')
          }
        }
      },
      series: [
        {
          data: seriesData16,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        },
        {
          data: prevSeriesData16,
          type: 'bar',
          barWidth: 14,
          barMinHeight: 2
        }
      ]
    }
    myChart.setOption(option)
    document.getElementById('imgCanvas16').src = myChart.getDataURL({pixelRatio: 1})
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

  var total19 = top3S2cTotalTraffic[0]
  var seriesData19 = []
  var startAngle19 = 90
  if (total19) {
    var missedCache19 = missedCacheS2cTraffic.find(t => total19.server_idc_renter ===  t.client_idc_renter)
    if (missedCache19) {
      seriesData19.push({ name: '缓存未命中流量', value: missedCache19.received_bytes })
      seriesData19.push({ name: '缓存命中流量', value: total19.received_bytes - missedCache19.received_bytes })
      var halfAngle19 = (seriesData19[0].value / total19.received_bytes) * 360 / 2
      startAngle19 = startAngle19 + halfAngle19 - 5
    }
  }

  function initEcharts19 () {
    var myChart = echarts.init(document.getElementById('canvas19'))
    var option = JSON.parse(JSON.stringify(pieOption))
    option.series[0].data = seriesData19
    option.title.text = total19 ? total19.server_idc_renter : '-'
    option.series[0].startAngle = startAngle19
    myChart.setOption(option)
    document.getElementById('imgCanvas19').src = myChart.getDataURL({pixelRatio: 1})
  }

  var total20 = top3S2cTotalTraffic[1]
  var seriesData20 = []
  var startAngle20 = 90
  if (total20) {
    var missedCache20 = missedCacheS2cTraffic.find(t => total20.server_idc_renter ===  t.client_idc_renter)
    if (missedCache20) {
      seriesData20.push({ name: '缓存未命中流量', value: missedCache20.received_bytes })
      seriesData20.push({ name: '缓存命中流量', value: total20.received_bytes - missedCache20.received_bytes })
      var halfAngle20 = (seriesData20[0].value / total20.received_bytes) * 360 / 2
      startAngle20 = startAngle20 + halfAngle20 - 5
    }
  }
  function initEcharts20 () {
    var myChart = echarts.init(document.getElementById('canvas20'))
    var option = JSON.parse(JSON.stringify(pieOption))
    option.series[0].data = seriesData20
    option.title.text = total20 ? total20.server_idc_renter : '-'
    option.series[0].startAngle = startAngle20
    myChart.setOption(option)
    document.getElementById('imgCanvas20').src = myChart.getDataURL({pixelRatio: 1})
  }

  var total21 = top3S2cTotalTraffic[2]
  var seriesData21 = []
  var startAngle21 = 90
  if (total21) {
    var missedCache21 = missedCacheS2cTraffic.find(t => total21.server_idc_renter ===  t.client_idc_renter)
    if (missedCache21) {
      seriesData21.push({ name: '缓存未命中流量', value: missedCache21.received_bytes })
      seriesData21.push({ name: '缓存命中流量', value: total21.received_bytes - missedCache21.received_bytes })
      var halfAngle21 = (seriesData21[0].value / total21.received_bytes) * 360 / 2
      startAngle21 = startAngle21 + halfAngle21 - 5
    }
  }
  function initEcharts21 () {
    var myChart = echarts.init(document.getElementById('canvas21'))
    var option = JSON.parse(JSON.stringify(pieOption))
    option.series[0].data = seriesData21
    option.title.text = total21 ? total21.server_idc_renter : '-'
    option.series[0].startAngle = startAngle21
    myChart.setOption(option)
    document.getElementById('imgCanvas21').src = myChart.getDataURL({pixelRatio: 1})
  }

  var total22 = top3Sessions[0]
  var seriesData22 = []
  var startAngle22 = 90
  if (total22) {
    var missedCache22 = missedCacheSession.find(t => total22.server_idc_renter ===  t.client_idc_renter)
    if (missedCache22) {
      seriesData22.push({ name: '缓存未命中会话', value: missedCache22.sessions })
      seriesData22.push({ name: '缓存命中会话', value: total22.sessions - missedCache22.sessions })
      var halfAngle22 = (seriesData22[0].value / total22.sessions) * 360 / 2
      startAngle22 = startAngle22 + halfAngle22 - 5
    }
  }
  function initEcharts22 () {
    var myChart = echarts.init(document.getElementById('canvas22'))
    var option = JSON.parse(JSON.stringify(pieOption))
    option.series[0].data = seriesData22
    option.title.text = total22 ? total22.server_idc_renter : '-'
    option.series[0].startAngle = startAngle22
    myChart.setOption(option)
    document.getElementById('imgCanvas22').src = myChart.getDataURL({pixelRatio: 1})
  }

  var total23 = top3Sessions[1]
  var seriesData23 = []
  var startAngle23 = 90
  if (total23) {
    var missedCache23 = missedCacheSession.find(t => total23.server_idc_renter ===  t.client_idc_renter)
    if (missedCache23) {
      seriesData23.push({ name: '缓存未命中会话', value: missedCache23.sessions })
      seriesData23.push({ name: '缓存命中会话', value: total23.sessions - missedCache23.sessions })
      var halfAngle23 = (seriesData23[0].value / total23.sessions) * 360 / 2
      startAngle23 = startAngle23 + halfAngle23 - 5
    }
  }
  function initEcharts23 () {
    var myChart = echarts.init(document.getElementById('canvas23'))
    var option = JSON.parse(JSON.stringify(pieOption))
    option.series[0].data = seriesData23
    option.title.text = total23 ? total23.server_idc_renter : '-'
    option.series[0].startAngle = startAngle23
    myChart.setOption(option)
    document.getElementById('imgCanvas23').src = myChart.getDataURL({pixelRatio: 1})
  }

  var total24 = top3Sessions[2]
  var seriesData24 = []
  var startAngle24 = 90
  if (total24) {
    var missedCache24 = missedCacheSession.find(t => total24.server_idc_renter ===  t.client_idc_renter)
    if (missedCache24) {
      seriesData24.push({ name: '缓存未命中会话', value: missedCache24.sessions })
      seriesData24.push({ name: '缓存命中会话', value: total24.sessions - missedCache24.sessions })
      var halfAngle24 = parseFloat((seriesData24[0].value / total24.sessions)) * 360 / 2
      startAngle24 = startAngle24 + halfAngle24 - 5
    }
  }
  function initEcharts24 () {
    var myChart = echarts.init(document.getElementById('canvas24'))
    var option = JSON.parse(JSON.stringify(pieOption))
    option.series[0].data = seriesData24
    option.title.text = total24 ? total24.server_idc_renter : '-'
    option.series[0].startAngle = startAngle24
    myChart.setOption(option)
    document.getElementById('imgCanvas24').src = myChart.getDataURL({pixelRatio: 1})
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
  initEcharts12()
  initEcharts13()
  initEcharts14()
  initEcharts15()
  initEcharts16()
  initEcharts17()
  initEcharts18()
  initEcharts19()
  initEcharts20()
  initEcharts21()
  initEcharts22()
  initEcharts23()
  initEcharts24()
  initEcharts25()
  initEcharts26()
  initEcharts27()
  initEcharts28()
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
