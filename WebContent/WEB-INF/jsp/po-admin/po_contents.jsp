<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<% String url = basePath+""; %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<!-- BEGIN PAGE CONTENT-->
			<input type="text" class="form-control" name="readOnlyFlag" value="${readOnlyFlag}" style="display: none;">
			<div class="row approval-content">
				<div class="col-md-12">
					<!-- Begin: life time stats -->
					<div class="portlet">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-shopping-cart"></i>系统单号：${order.order_number} <span class="hidden-480">
								| 创建时间：${order.purchase_date} </span>
							</div>
							<div class="actions">
								<a onclick="history.go(-1)" class="btn default yellow-stripe">
								<i class="fa fa-angle-left"></i>
								<span class="hidden-480">
								返回 </span>
								</a>
								<div class="btn-group">
									<a class="btn default yellow-stripe dropdown-toggle" href="#" data-toggle="dropdown">
									<i class="fa fa-cog"></i>
									<span class="hidden-480">
									工具 </span>
									<i class="fa fa-angle-down"></i>
									</a>
									<ul class="dropdown-menu pull-right">
<%-- 										<c:if test="${order.status_code != 'completed' && order.status_code != 'cancelled'}"> --%>
<!-- 										<li> -->
<!-- 											<a href="#" class="hold-order"> -->
<!-- 											搁置订单 </a> -->
<!-- 										</li> -->
<%-- 										</c:if> --%>
<%-- 										<c:if test="${order.status_code != 'completed' && order.status_code != 'cancelled'}"> --%>
<!-- 										<li> -->
<!-- 											<a href="#" class="cancel-order"> -->
<!-- 											取消订单</a> -->
<!-- 										</li> -->
<%-- 										</c:if> --%>
<!-- 										<li> -->
<%-- 											<a href="exportPO.do?orderId=${order.order_id}&orderNumber=${order.order_number}"> --%>
<!-- 											导出到Excel </a> -->
<!-- 										</li> -->
										<c:if test="${order.status_code == 'archived'}">
										<li>
											<a href="#" class="generate-req">
											生成入库单 </a>
										</li>
										</c:if>
										<c:if test="${order.status_code == 'submit - approved' || order.status_code == 'submitted'}">
										<li>
											<a href="#" class="scan-order">
											盖章扫描件回传 </a>
										</li>
										</c:if>
										<c:if test="${order.status_code == 'scanned'}">
										<li>
											<a href="#" class="archive-order">
											原件入档 </a>
										</li>
										</c:if>
										<c:if test="${order.status_code == 'processing'}">
										<li>
											<a href="#" class="complete-order">
											完成订单 </a>
										</li>
										</c:if>
										<c:if test="${order.status_code == 'cancelled' || order.status_code == 'submit - rejected'}">
										<li>
											<a href="#" class="reopen-order">
											重开订单 </a>
										</li>
										</c:if>
									</ul>
								</div>
							</div>
						</div>
						<div class="portlet-body">
							<div class="tabbable">
								<ul class="nav nav-tabs nav-tabs-lg">
									<li class="active">
										<a href="#tab_1" data-toggle="tab">
										详细信息 </a>
									</li>
									<li style="display :none;">
										<a href="#tab_2" data-toggle="tab">
										Invoices <span class="badge badge-success">
										4 </span>
										</a>
									</li>
									<li style="display :none;">
										<a href="#tab_3" data-toggle="tab">
										Credit Memos </a>
									</li>
									<li>
										<a href="#tab_4" data-toggle="tab">
										关联单据 </a>
									</li>
									<li>
										<a href="#tab_attachment" data-toggle="tab">
										附件 </a>
									</li>
									<li>
										<a href="#tab_5" data-toggle="tab" class="queryApprovalStatus">
										查看审批流程 </a>
									</li>
									<li>
										<a href="#tab_6" data-toggle="tab">
										审批历史记录 </a>
									</li>
									<li>
										<a href="#tab_7" data-toggle="tab">
										更新历史记录 </a>
									</li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="tab_1">
										<div class="row">
											<div class="col-md-6 col-sm-12">
												<div class="portlet yellow-crusta box">
													<div class="portlet-title">
														<div class="caption">
															<i class="fa fa-cogs"></i>订单基本信息
														</div>
														<c:if test="${readOnlyFlag == false}">
														<div class="actions">
															<a href="javascript:;" class="btn btn-default btn-sm order-base-update">
															<i class="fa fa-pencil"></i> 保存更改 </a>
														</div>
														</c:if>
													</div>
													<div class="portlet-body">
														<div class="row static-info">
															<div class="col-md-5 name">
																 人工订单号 #:
															</div>
															<div class="col-md-7 value">
																 <input type="text" class="form-control" placeholder="请输入人工单据号…" name="order[man_number]" value="${order.order_manual_number}" <c:if test="${readOnlyFlag == true}">readonly</c:if>>
															</div>
														</div>
														<div class="row static-info">
															<div class="col-md-5 name">
																 订单状态:
															</div>
															<div class="col-md-7 value">
																<input type="text" class="form-control" name="order[status_code]" value="${order.status_code}" style="display: none;">
																<span class="label label-success">
																${order.status_value} </span>
															</div>
														</div>
														<div class="row static-info">
															<div class="col-md-5 name">
																订单总金额（${order.currency_val}）:
															</div>
															<div class="col-md-7 value static-total-due">
																 ${order.due_amount}
															</div>
														</div>
														<div class="row static-info">
															<div class="col-md-5 name">
																 经手人:
															</div>
															<div class="col-md-7 value">
																 ${order.created_by_name}
															</div>
														</div>
														<div class="row static-info">
																<div class="col-md-5 name">
																	付款状态：
																</div>
																<div class="col-md-7 value">
																	<select class="form-control" name="order[payment_status]" <c:if test="${readOnlyFlag == true}">readonly</c:if>>
																		<c:forEach var="payment_status" items="${payment_status_list}">
																			<option value="${payment_status.list_name}" <c:if test="${order.payment_status_code == payment_status.list_name}">selected</c:if> >${payment_status.list_value}</option>
																		</c:forEach>
																	</select>
																</div>
														</div>
														<div class="row static-info">
																<div class="col-md-5 name">付款百分比：</div>
																<div class="col-md-7 value">
																	<div class="input-inline input-medium">
																		<input type="text" value="${order.payment_ratio}" name="order[payment_ratio]" class="form-control touchspin_percent" <c:if test="${readOnlyFlag == true}">readonly</c:if>>
																	</div>
																</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-6 col-sm-12">
												<div class="portlet red-sunglo box">
													<div class="portlet-title">
														<div class="caption">
															<i class="fa fa-cogs"></i>订单备注
														</div>
														<c:if test="${readOnlyFlag == false}">
														<div class="actions">
															<a href="javascript:;" class="btn btn-default btn-sm po-comment-update">
															<i class="fa fa-pencil"></i> 保存更改 </a>
														</div>
														</c:if>
													</div>
													<div class="portlet-body">
														<div class="form-group">
															<textarea class="form-control" rows="6"
																placeholder="输入订单备注…" name="order[description]" <c:if test="${readOnlyFlag == true}">readonly</c:if>>${order.order_comment}</textarea>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
<!-- 											<div class="col-md-6 col-sm-12"> -->
<!-- 												<div class="portlet green-meadow box"> -->
<!-- 													<div class="portlet-title"> -->
<!-- 														<div class="caption"> -->
<!-- 															<i class="fa fa-cogs"></i>收货仓库信息 -->
<!-- 														</div> -->
<!-- 														<div class="actions"> -->
<!-- 															<a href="#receive-wh-pick" class="btn btn-default btn-sm receive-wh-pick" data-toggle="modal"> -->
<!-- 															<i class="fa fa-pencil"></i> 选取收货仓库 </a> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 													<div class="portlet-body receive-wh-info"> -->
<!-- 														<div class="row static-info"> -->
<!-- 															<div class="col-md-5 name"> -->
<!-- 																 仓库编号: -->
<!-- 															</div> -->
<!-- 															<div class="col-md-7 value"> -->
<%-- 																 ${warehouse.number} --%>
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 														<div class="row static-info"> -->
<!-- 															<div class="col-md-5 name"> -->
<!-- 																 仓库名称: -->
<!-- 															</div> -->
<!-- 															<div class="col-md-7 value"> -->
<%-- 																 <a href="<%=path%>/inventory/warehouse_details.do?id=${warehouse.id}">${warehouse.name}</a> --%>
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 														<div class="row static-info"> -->
<!-- 															<div class="col-md-5 name"> -->
<!-- 																 仓库联系人: -->
<!-- 															</div> -->
<!-- 															<div class="col-md-7 value"> -->
<%-- 																 ${warehouse.primary_contact_name} --%>
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 														<div class="row static-info"> -->
<!-- 															<div class="col-md-5 name"> -->
<!-- 																 联系人电话: -->
<!-- 															</div> -->
<!-- 															<div class="col-md-7 value"> -->
<%-- 																 ${warehouse.primary_contact_cellphone} --%>
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 														<div class="row static-info"> -->
<!-- 															<div class="col-md-5 name"> -->
<!-- 																 仓库地址: -->
<!-- 															</div> -->
<!-- 															<div class="col-md-7 value"> -->
<%-- 																 ${warehouse.primary_addr_name} --%>
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="col-md-6 col-sm-12"> -->
<!-- 												<div class="portlet blue-hoki box"> -->
<!-- 													<div class="portlet-title"> -->
<!-- 														<div class="caption"> -->
<!-- 															<i class="fa fa-cogs"></i>账单地址详情 -->
<!-- 														</div> -->
<%-- 														<c:if test="${readOnlyFlag == false}"> --%>
<!-- 														<div class="actions"> -->
<!-- 															<a href="#bill-address-pick" class="btn btn-default btn-sm bill-address-pick" data-toggle="modal"> -->
<!-- 															<i class="fa fa-pencil"></i> 选取账单地址 </a> -->
<!-- 														</div> -->
<%-- 														</c:if> --%>
<!-- 													</div> -->
<!-- 													<div class="portlet-body bill-address-info"> -->
<!-- 														<div class="row static-info"> -->
<!-- 															<div class="col-md-5 name"> -->
<!-- 																 联系人: -->
<!-- 															</div> -->
<!-- 															<div class="col-md-7 value"> -->
<%-- 																 ${bill_address.contactName} --%>
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 														<div class="row static-info"> -->
<!-- 															<div class="col-md-5 name"> -->
<!-- 																 联系人电话: -->
<!-- 															</div> -->
<!-- 															<div class="col-md-7 value"> -->
<%-- 																 ${bill_address.contactCell} --%>
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 														<div class="row static-info"> -->
<!-- 															<div class="col-md-5 name"> -->
<!-- 																 省/直辖市: -->
<!-- 															</div> -->
<!-- 															<div class="col-md-7 value"> -->
<%-- 																 ${bill_address.province} --%>
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 														<div class="row static-info"> -->
<!-- 															<div class="col-md-5 name"> -->
<!-- 																 城市: -->
<!-- 															</div> -->
<!-- 															<div class="col-md-7 value"> -->
<%-- 																 ${bill_address.city} --%>
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 														<div class="row static-info"> -->
<!-- 															<div class="col-md-5 name"> -->
<!-- 																 区/县: -->
<!-- 															</div> -->
<!-- 															<div class="col-md-7 value"> -->
<%-- 																 ${bill_address.county} --%>
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 														<div class="row static-info"> -->
<!-- 															<div class="col-md-5 name"> -->
<!-- 																 街道: -->
<!-- 															</div> -->
<!-- 															<div class="col-md-7 value"> -->
<%-- 																 ${bill_address.street} --%>
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 														<div class="row static-info"> -->
<!-- 															<div class="col-md-5 name"> -->
<!-- 																 邮编: -->
<!-- 															</div> -->
<!-- 															<div class="col-md-7 value"> -->
<%-- 																 ${bill_address.zipcode} --%>
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="col-md-6 col-sm-12"> -->
<!-- 												<div class="portlet red-sunglo box"> -->
<!-- 													<div class="portlet-title"> -->
<!-- 														<div class="caption"> -->
<!-- 															<i class="fa fa-cogs"></i>经手人信息 -->
<!-- 														</div> -->
<%-- 														<c:if test="${readOnlyFlag == false}"> --%>
<!-- 														<div class="actions"> -->
<!-- 															<a href="#owner-pick" class="btn btn-default btn-sm owner-pick" data-toggle="modal"> -->
<!-- 															<i class="fa fa-pencil"></i> 更改经手人 </a> -->
<!-- 														</div> -->
<%-- 														</c:if> --%>
<!-- 													</div> -->
<!-- 													<div class="portlet-body owner-info"> -->
<!-- 														<div class="row static-info"> -->
<!-- 															<div class="col-md-5 name"> -->
<!-- 																 经手人账号: -->
<!-- 															</div> -->
<!-- 															<div class="col-md-7 value"> -->
<%-- 																 ${owner.userName} --%>
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 														<div class="row static-info"> -->
<!-- 															<div class="col-md-5 name"> -->
<!-- 																 经手人姓: -->
<!-- 															</div> -->
<!-- 															<div class="col-md-7 value"> -->
<%-- 																 ${owner.lastName} --%>
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 														<div class="row static-info"> -->
<!-- 															<div class="col-md-5 name"> -->
<!-- 																 经手人名字: -->
<!-- 															</div> -->
<!-- 															<div class="col-md-7 value"> -->
<%-- 																 ${owner.firstName} --%>
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 														<div class="row static-info"> -->
<!-- 															<div class="col-md-5 name"> -->
<!-- 																 经手人职位: -->
<!-- 															</div> -->
<!-- 															<div class="col-md-7 value"> -->
<%-- 																 ${owner.position.positionName} --%>
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 														<div class="row static-info"> -->
<!-- 															<div class="col-md-5 name"> -->
<!-- 																 经手人邮箱: -->
<!-- 															</div> -->
<!-- 															<div class="col-md-7 value"> -->
<%-- 																 ${owner.email} --%>
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
										</div>
										<div class="row">
											<div class="col-md-6 col-sm-12">
												<div class="portlet blue-hoki box">
													<div class="portlet-title">
														<div class="caption">
															<i class="fa fa-cogs"></i>直接供应商信息
														</div>
														<c:if test="${readOnlyFlag == false}">
														<div class="actions">
															<a href="#supplier-pick" class="btn btn-default btn-sm supplier-pick" data-toggle="modal">
															<i class="fa fa-pencil"></i> 选取直接供应商 </a>
														</div>
														</c:if>
													</div>
													<div class="portlet-body supplier-info">
														<div class="row static-info">
															<div class="col-md-5 name">
																 供应商编号:
															</div>
															<div class="col-md-7 value">
																 ${supplier.accountNumber}
															</div>
														</div>
														<div class="row static-info">
															<div class="col-md-5 name">
																 供应商名称:
															</div>
															<div class="col-md-7 value">
																 ${supplier.accountName}
															</div>
														</div>
														<div class="row static-info">
															<div class="col-md-5 name">
																 电子邮件:
															</div>
															<div class="col-md-7 value">
																 ${supplier.email}
															</div>
														</div>
														<div class="row static-info">
															<div class="col-md-5 name">
																 供应商区域:
															</div>
															<div class="col-md-7 value">
																 ${supplier.address.allAddress}
															</div>
														</div>
														<div class="row static-info">
															<div class="col-md-5 name">
																 电话号码:
															</div>
															<div class="col-md-7 value">
																 ${supplier.workphone}
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-6 col-sm-12">
												<div class="portlet blue-hoki box">
													<div class="portlet-title">
														<div class="caption">
															<i class="fa fa-cogs"></i>间接供应商信息
														</div>
														<c:if test="${readOnlyFlag == false}">
														<div class="actions">
															<a href="#supplier-lv2-pick" class="btn btn-default btn-sm supplier-lv2-pick" data-toggle="modal">
															<i class="fa fa-pencil"></i> 选取间接供应商 </a>
														</div>
														</c:if>
													</div>
													<div class="portlet-body supplier-lv2-info">
														<div class="row static-info">
															<div class="col-md-5 name">
																 供应商编号:
															</div>
															<div class="col-md-7 value">
																 ${supplier_lv2.accountNumber}
															</div>
														</div>
														<div class="row static-info">
															<div class="col-md-5 name">
																 供应商名称:
															</div>
															<div class="col-md-7 value">
																 ${supplier_lv2.accountName}
															</div>
														</div>
														<div class="row static-info">
															<div class="col-md-5 name">
																 电子邮件:
															</div>
															<div class="col-md-7 value">
																 ${supplier_lv2.email}
															</div>
														</div>
														<div class="row static-info">
															<div class="col-md-5 name">
																 供应商区域:
															</div>
															<div class="col-md-7 value">
																 ${supplier_lv2.address.allAddress}
															</div>
														</div>
														<div class="row static-info">
															<div class="col-md-5 name">
																 电话号码:
															</div>
															<div class="col-md-7 value">
																 ${supplier_lv2.workphone}
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12 col-sm-12">
												<div class="portlet grey-cascade box">
													<div class="portlet-title">
														<div class="caption">
															<i class="fa fa-cogs"></i>采购明细
														</div>
														<c:if test="${readOnlyFlag == false}">
														<div class="actions">
															<a href="#add-item" class="btn btn-default btn-sm" data-toggle="modal">
															<i class="fa fa-plus"></i> 添加 </a>
														</div>
														</c:if>
													</div>
													<div class="portlet-body">
														<div class="table-responsive">
															<table class="table table-hover table-bordered table-striped order-items">
															<thead>
															<tr>
																<th>
																	 产品型号
																</th>
																<th>
																	收货仓库
																</th>
<!-- 																<th> -->
<!-- 																	 基础单价（元） -->
<!-- 																</th> -->
																<th>
																	 购买单价（${order.currency_val}）
																</th>
																<th>
																	 购买数量
																</th>
																<th>
																	 税额（${order.currency_val}）
																</th>
																<th>
																	 税率（%）
																</th>
<!-- 																<th> -->
<!-- 																	 折扣金额（元） -->
<!-- 																</th> -->
																<th>
																	 合计金额（${order.currency_val}）
																</th>
																<th>
																	 备注
																</th>
																<th>
																	操作
																</th>
															</tr>
															</thead>
															<tbody>
															<!-- Generated by po-view-events.js -->
															</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
											</div>
											<div class="col-md-6">
												<div class="well">
													<div class="row static-info align-reverse">
														<div class="col-md-8 name">
															 基础金额合计（${order.currency_val}）:
														</div>
														<div class="col-md-3 value base-total">
															 $1,124.50
														</div>
													</div>
													<div class="row static-info align-reverse">
														<div class="col-md-8 name">
															 税额合计（${order.currency_val}）:
														</div>
														<div class="col-md-3 value tax-total">
															 $1,260.00
														</div>
													</div>
<!-- 													<div class="row static-info align-reverse"> -->
<!-- 														<div class="col-md-8 name"> -->
<!-- 															 折扣金额合计（元）: -->
<!-- 														</div> -->
<!-- 														<div class="col-md-3 value discount-total"> -->
<!-- 															 $1,260.00 -->
<!-- 														</div> -->
<!-- 													</div> -->
													<div class="row static-info align-reverse">
														<div class="col-md-8 name">
															 应付金额合计（${order.currency_val}）:
														</div>
														<div class="col-md-3 value due-total">
															 $1,124.50
														</div>
													</div>
													<div class="row static-info align-reverse approval-buttons">
														<div class="col-md-8">
														</div>
															<c:choose>
																<c:when test="${order.status_code != 'new' && order.status_code != 'reopen' && order.status_code != 'submit-rejected'}">
																	<a class="btn btn-lg dark m-icon-big">
																		提交 <i class="m-icon-big-swapup m-icon-white"></i>
																	</a>
																</c:when>
																<c:otherwise>
																	<a href="#"
																		class="btn btn-lg green m-icon-big submit-order">
																		提交 <i class="m-icon-big-swapup m-icon-white"></i>
																	</a>
																</c:otherwise>
															</c:choose>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="tab-pane" id="tab_2">
										<div class="table-container">
											<div class="table-actions-wrapper">
												<span>
												</span>
												<select class="table-group-action-input form-control input-inline input-small input-sm">
													<option value="">Select...</option>
													<option value="pending">Pending</option>
													<option value="paid">Paid</option>
													<option value="canceled">Canceled</option>
												</select>
												<button class="btn btn-sm yellow table-group-action-submit"><i class="fa fa-check"></i> Submit</button>
											</div>
											<table class="table table-striped table-bordered table-hover" id="datatable_invoices">
											<thead>
											<tr role="row" class="heading">
												<th width="5%">
													<input type="checkbox" class="group-checkable">
												</th>
												<th width="5%">
													 Invoice&nbsp;#
												</th>
												<th width="15%">
													 Bill To
												</th>
												<th width="15%">
													 Invoice&nbsp;Date
												</th>
												<th width="10%">
													 Amount
												</th>
												<th width="10%">
													 Status
												</th>
												<th width="10%">
													 Actions
												</th>
											</tr>
											<tr role="row" class="filter">
												<td>
												</td>
												<td>
													<input type="text" class="form-control form-filter input-sm" name="order_invoice_no">
												</td>
												<td>
													<input type="text" class="form-control form-filter input-sm" name="order_invoice_bill_to">
												</td>
												<td>
													<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
														<input type="text" class="form-control form-filter input-sm" readonly name="order_invoice_date_from" placeholder="From">
														<span class="input-group-btn">
														<button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
														</span>
													</div>
													<div class="input-group date date-picker" data-date-format="dd/mm/yyyy">
														<input type="text" class="form-control form-filter input-sm" readonly name="order_invoice_date_to" placeholder="To">
														<span class="input-group-btn">
														<button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
														</span>
													</div>
												</td>
												<td>
													<div class="margin-bottom-5">
														<input type="text" class="form-control form-filter input-sm" name="order_invoice_amount_from" placeholder="From"/>
													</div>
													<input type="text" class="form-control form-filter input-sm" name="order_invoice_amount_to" placeholder="To"/>
												</td>
												<td>
													<select name="order_invoice_status" class="form-control form-filter input-sm">
														<option value="">Select...</option>
														<option value="pending">Pending</option>
														<option value="paid">Paid</option>
														<option value="canceled">Canceled</option>
													</select>
												</td>
												<td>
													<div class="margin-bottom-5">
														<button class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i> Search</button>
													</div>
													<button class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i> Reset</button>
												</td>
											</tr>
											</thead>
											<tbody>
											</tbody>
											</table>
										</div>
									</div>
									<div class="tab-pane" id="tab_3">
										<div class="table-container">
											<table class="table table-striped table-bordered table-hover" id="datatable_credit_memos">
											<thead>
											<tr role="row" class="heading">
												<th width="5%">
													 Credit&nbsp;Memo&nbsp;#
												</th>
												<th width="15%">
													 Bill To
												</th>
												<th width="15%">
													 Created&nbsp;Date
												</th>
												<th width="10%">
													 Status
												</th>
												<th width="10%">
													 Actions
												</th>
											</tr>
											</thead>
											<tbody>
											</tbody>
											</table>
										</div>
									</div>
									<div class="tab-pane" id="tab_4">
										<div class="table-container">
											<table class="table table-striped table-bordered table-hover" id="datatable_shipment">
											<thead>
											<tr role="row" class="heading">
												<th width="15%">
													 单据系统编号
												</th>
												<th width="10%">
													 单据人工编号
												</th>
												<th width="10%">
													 单据类型
												</th>
												<th width="10%">
													 单据状态
												</th>
												<th width="10%">
													 收发货仓库
												</th>
												<th width="10%">
													 创建时间
												</th>
												<th width="10%">
													 经手人
												</th>
											</tr>
											</thead>
											<tbody>
											<c:forEach var="related_req" items="${related_req_list}">
	                 		<%--用EL表达式调用list对象的属性循环输出对象的各个属性值--%> 
	                		<tr class="odd gradeX" id="${related_req.requisition_id}">
	                    		<td><a href="<%=path%>/inventory/stock_in_all_details.do?id=${related_req.requisition_id}">
	                    		${related_req.requisition_number}</a></td>
	                    		<td>
	                    			${related_req.requisition_manual_number}        		
								</td>
	                    		<td>
	                    			${related_req.requisition_type} 	
	                    		</td>
	                    		<td>
	                    			${related_req.status_value} 	
	                    		</td>
	                    		<td>
	                    			${related_req.receive_wh_name} 	
	                    		</td>
	                    		<td>
	                    		   	${related_req.created_date}      								
	                    		</td>
	                    		<td>
	                    			${related_req.owner_name}
	                    		</td>
	                  		</tr>	
											</c:forEach>
											</tbody>
											</table>
										</div>
									</div>
									<!-- Start attachment tab -->
									<div class="tab-pane" id="tab_attachment">
											<div id="tab_images_uploader_container" class="text-align-reverse margin-bottom-10">
												<c:if test="${readOnlyFlag == false}">
												<a id="tab_images_uploader_pickfiles" href="javascript:;" class="btn yellow">
												<i class="fa fa-plus"></i> 选择文件 </a>
												<a id="tab_images_uploader_uploadfiles" href="javascript:;" class="btn green">
												<i class="fa fa-share"></i> 上传文件 </a>
												</c:if>
											</div>
											<div class="row">
												<div id="tab_images_uploader_filelist" class="col-md-6 col-sm-12">
												</div>
											</div>
											<div class="row" style="display: none;">
												<span class="remove_image_id"></span>
												<span class="remove_image_filename"></span>
												<span class="remove_image_filepath"></span>
											</div>
											<table class="table table-bordered table-hover order-attachments">
											<thead>
											<tr role="row" class="heading">
												<th width="25%">
													 源文件名
												</th>
												<th width="10%">
													 大小
												</th>
												<th width="10%">
													 上传时间
												</th>
												<th width="10%">
													 上传人
												</th>
												<th width="10%">
												</th>
											</tr>
											</thead>
											<tbody>
											
											</tbody>
											</table>
										</div>
									<!-- End attachment tab -->
									<!-- Start approval status tab -->
									<div class="tab-pane" id="tab_5">
										<div class="portlet">
										<div class="portlet-title">
											<div class="caption">
												<i class="fa fa-shopping-cart"></i>当前审批状态
											</div>
										</div>
										<div class="portlet-body">
										<div class="table-container">
											<!-- BEGIN APPROVAL STATUS CONTENT-->
											<div class="row">
												<div class="col-md-12" id="approvalStatusDiv">
													
												</div>
											</div>
											<!-- END APPROVAL STATUS CONTENT-->
										</div>
										</div>
									</div>
									</div>
									<!-- End approval status tab -->
									<!-- Start approval history tab -->
									<div class="tab-pane" id="tab_6">
										<div class="portlet">
										<div class="portlet-title">
											<div class="caption">
												<i class="fa fa-shopping-cart"></i>所有审批历史记录
											</div>
											<div class="actions">
												<button class="btn btn-sm green approval-history-query-assistant"><i class="fa fa-search"></i> 搜索</button>
												<button class="btn btn-sm yellow approval-history-query-cancel" style="display: none;"><i class="fa fa-search"></i> 取消搜索</button>
												<div class="btn-group">
													<a class="btn default yellow-stripe dropdown-toggle" href="#" data-toggle="dropdown">
													<i class="fa fa-share"></i> 工具 <i class="fa fa-angle-down"></i>
													</a>
												</div>
											</div>
										</div>
										<div class="portlet-body">
										<div class="table-container">
											<table class="table table-striped table-bordered table-hover" id="datatable_approval_history">
											<thead>
											<tr role="row" class="heading">
												<th width="25%">
													 审核时间
												</th>
												<th width="55%">
													 审核描述
												</th>
												<th width="10%">
													 审核人
												</th>
												<th width="10%">
													 操作
												</th>
											</tr>
											<tr role="row" class="approval-history-filter" style="display: none;">
												<td>
													<div class="input-group date datetime-picker margin-bottom-5" data-date-format="dd/mm/yyyy hh:ii">
														<input type="text" class="form-control form-filter input-sm" readonly name="order_history_date_from" placeholder="从">
														<span class="input-group-btn">
														<button class="btn btn-sm default date-set" type="button"><i class="fa fa-calendar"></i></button>
														</span>
													</div>
													<div class="input-group date datetime-picker" data-date-format="dd/mm/yyyy hh:ii">
														<input type="text" class="form-control form-filter input-sm" readonly name="order_history_date_to" placeholder="到">
														<span class="input-group-btn">
														<button class="btn btn-sm default date-set" type="button"><i class="fa fa-calendar"></i></button>
														</span>
													</div>
												</td>
												<td>
													<input type="text" class="form-control form-filter input-sm" name="order_history_desc" placeholder="请输入描述"/>
												</td>
												<td>
													<input type="text" class="form-control form-filter input-sm" name="order_created_by_username" placeholder="请输入更新人名字"/>
												</td>
												<td>
													<div class="margin-bottom-5">
														<button class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i> 开始搜索</button>
													</div>
													<button class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i> 重置搜索</button>
												</td>
											</tr>
											</thead>
											<tbody>
											</tbody>
											</table>
										</div>
									</div>
									</div>
									</div>
									<!-- End approval history tab -->
									<div class="tab-pane" id="tab_7">
										<div class="portlet">
										<div class="portlet-title">
											<div class="caption">
												<i class="fa fa-shopping-cart"></i>所有订单更新历史记录
											</div>
											<div class="actions">
												<button class="btn btn-sm green order-history-query-assistant"><i class="fa fa-search"></i> 搜索</button>
											<button class="btn btn-sm yellow order-history-query-cancel" style="display: none;"><i class="fa fa-search"></i> 取消搜索</button>
											</div>
										</div>
										<div class="portlet-body">
										<div class="table-container">
											<table class="table table-striped table-bordered table-hover" id="datatable_history">
											<thead>
											<tr role="row" class="heading">
												<th width="25%">
													 更新时间
												</th>
												<th width="55%">
													 更新描述
												</th>
												<th width="10%">
													 更新人
												</th>
												<th width="10%">
													 操作
												</th>
											</tr>
											<tr role="row" class="order-history-filter" style="display: none;">
												<td>
													<div class="input-group date datetime-picker margin-bottom-5" data-date-format="dd/mm/yyyy hh:ii">
														<input type="text" class="form-control form-filter input-sm" readonly name="order_history_date_from" placeholder="从">
														<span class="input-group-btn">
														<button class="btn btn-sm default date-set" type="button"><i class="fa fa-calendar"></i></button>
														</span>
													</div>
													<div class="input-group date datetime-picker" data-date-format="dd/mm/yyyy hh:ii">
														<input type="text" class="form-control form-filter input-sm" readonly name="order_history_date_to" placeholder="到">
														<span class="input-group-btn">
														<button class="btn btn-sm default date-set" type="button"><i class="fa fa-calendar"></i></button>
														</span>
													</div>
												</td>
												<td>
													<input type="text" class="form-control form-filter input-sm" name="order_history_desc" placeholder="请输入描述"/>
												</td>
												<td>
													<input type="text" class="form-control form-filter input-sm" name="order_created_by_username" placeholder="请输入更新人名字"/>
												</td>
												<td>
													<div class="margin-bottom-5">
														<button class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i> 开始搜索</button>
													</div>
													<button class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i> 重置搜索</button>
												</td>
											</tr>
											</thead>
											<tbody>
											</tbody>
											</table>
										</div>
									</div>
									</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- End: life time stats -->
				</div>
			</div>
			<!-- END PAGE CONTENT-->