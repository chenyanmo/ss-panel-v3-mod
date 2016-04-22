







{include file='user/main.tpl'}




	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">节点列表</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<h4>注意!</h4>
									<p>请勿在任何地方公开节点地址！</p>
									<p>流量比例为0.5即使用1000MB按照500MB流量记录记录结算.</p>
									<p>菜单分两级，点击某个节点名称展开这个节点的方式后，可以点击这个方式查看具体的配置信息。</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="ui-card-wrap">
					<div class="row">
						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<div class="tile-wrap">
											{foreach $node_prefix as $prefix => $nodes}
												
													<div class="tile tile-collapse">
														<div data-target="#heading{$node_order->$prefix}" data-toggle="tile">
															<div class="tile-side pull-left" data-ignore="tile">
																<div class="avatar avatar-sm">
																	<span class="icon {if $node_heartbeat[$prefix]=='在线'}text-green{else}text-red{/if}">{if $node_heartbeat[$prefix]=="在线"}backup{else}warning{/if}</span>
																</div>
															</div>
															<div class="tile-inner">
																<div class="text-overflow">{$prefix} | <i class="icon icon-lg">person</i> {$node_alive[$prefix]} | <i class="icon icon-lg">build</i> {$node_method[$prefix]} | <i class="icon icon-lg">traffic</i> {$node_bandwidth[$prefix]}</div>
															</div>
														</div>
														<div class="tile-active-show collapse" id="heading{$node_order->$prefix}">
															<div class="tile-sub">
																
																<br>
																{foreach $nodes as $node}
																
																	
																	<div class="card">
																		<div class="card-main">
																			<div class="card-inner"> 
																			<p class="card-heading" >
																				<a href="javascript:void(0);" onClick="urlChange('{$node->id}')">{$node->name}</a> 
																				<span class="label label-green">{$node->status}</span>
																			</p>
																			
																			
																			{if $node->sort > 2 && $node->sort != 5}
																				<p>地址：<span class="label" > 
																				<a href="javascript:void(0);" onClick="urlChange('{$node->id}')">请点这里进入查看详细信息</a>
																			{else}
																				<p>地址：<span class="label label-brand-accent"> 
																				{$node->server}
																			{/if}
																				
																				</span></p>
																			
																			{if $node->sort == 0||$node->sort==7||$node->sort==8}
																				<p>加密方式：<span class="label label-brand"> 
																					{if $node->custom_method == 1}
																						{$user->method}
																					{else}
																						{$node->method}
																					{/if}
																				</span></p>
																				
																				
																				<p>流量比例：<span class="label label-red"> 
																					{$node->traffic_rate}
																				</span></p>
																				
																				
																				<p>在线人数：<span class="label label-orange"> 
																					{$node->getOnlineUserCount()}
																				</span></p>
																			{/if}
																			
																			<p>{$node->info}</p>
																			
																			
																			
																			
																			 </div>
																			
																		</div>
																	</div>
																	
																	{if ($node->sort==0||$node->sort==7||$node->sort==8)&&$node->getNodeLoad()!="暂无数据"}
																	{$load=$node->getNodeLoad()}
																	{$uptime=$node->getNodeUptime()}
																	{/if}
																	
																	{if $node->sort==0}
																	{$speedtest=$node->getSpeedtest()}
																	{/if}
																	{/foreach}
																	
																	
																
																
																	
															</div>
															
																
																
															<p>{$speedtest}</p>
															<p><i class="icon icon-lg">cloud_down</i>负载：{$load} </p><p><i class="icon icon-lg">trending_up</i>Uptime：{$uptime}</p>
															<div class="tile-footer">
																<div class="tile-footer-btn pull-left">
																	<a class="btn btn-flat waves-attach" data-toggle="tile" href="#heading{$node_order->$prefix}"><span class="icon">close</span>&nbsp;关闭</a>
																</div>
															</div>
														</div>
												</div>
												{$load="暂无数据"}
												{$uptime="暂无数据"}
												{$speedtest="暂无数据"}
											{/foreach}
										</div>
									</div>
									
								</div>
							</div>
						</div>
						
						<div aria-hidden="true" class="modal fade" id="nodeinfo" role="dialog" tabindex="-1">
							<div class="modal-dialog modal-full">
								<div class="modal-content">
									<iframe class="iframe-seamless" src="https://www.zhaoj.in" title="Modal with iFrame" id="infoifram"></iframe>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>







{include file='user/footer.tpl'}


<script>
function urlChange(id) {
    var site = './node/'+id;
    document.getElementById('infoifram').src = site;
	$("#nodeinfo").modal();
}
</script>
