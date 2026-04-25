package com.icarte.module.usermgmt.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icarte.commons.Constants.SequenceHolderEnum;
import com.icarte.commons.ObjectTransformer;
import com.icarte.commons.Utilities;
import com.icarte.domain.Branch;
import com.icarte.domain.Customer;
import com.icarte.domain.Item;
import com.icarte.domain.ItemVariant;
import com.icarte.domain.OrderItems;
import com.icarte.domain.Orders;
import com.icarte.domain.ServingTable;
import com.icarte.domain.Staff;
import com.icarte.dto.OrderConfirmationDTO;
import com.icarte.dto.OrderDTO;
import com.icarte.dto.OrderItemDTO;
import com.icarte.dto.ResponseDTO;
import com.icarte.dto.SpecialDealDTO;
import com.icarte.module.branch.dao.BranchDAO;
import com.icarte.module.branch.dao.CustomerDAO;
import com.icarte.module.branch.dao.ServingTableDAO;
import com.icarte.module.branch.dao.StaffDAO;
import com.icarte.module.item.dao.ItemManagementDAO;
import com.icarte.module.item.dao.ItemVariantDAO;
import com.icarte.module.order.dao.OrderDAO;
import com.icarte.module.ordermgmt.service.OrderManagementService;
import com.icarte.module.ordermgmt.service.SequenceManagementService;
import com.icarte.module.specialdeal.service.SpecialDealMgmtService;

@Service
public class OrderManagementServiceImpl implements OrderManagementService {

	@Autowired
	private OrderDAO orderDAO;

	@Autowired
	private ItemManagementDAO itemDAO;

	@Autowired
	private SpecialDealMgmtService specialDealService;

	@Autowired
	private BranchDAO branchDAO;

	@Autowired
	private ItemVariantDAO itemVariantDAO;

	@Autowired
	private ServingTableDAO servingTableDAO;

	@Autowired
	private StaffDAO staffDAO;

	@Autowired
	private CustomerDAO customerDAO;

	@Autowired
	private SequenceManagementService sequenceService;

	@Transactional
	public OrderDTO getOrderData(Long orderId) {
		Orders order = orderDAO.findById(Orders.class, orderId);
		Item item = itemDAO.findById(Item.class, orderId);
		OrderDTO dto = ObjectTransformer.transformOrderToDto(order, item);
		List<SpecialDealDTO> specialDeals = specialDealService
				.findSpecialDeals(1L);
		dto.setSpecialDeals(specialDeals);
		return dto;
	}

	@Transactional
	public ResponseDTO<OrderConfirmationDTO> createOrder(OrderDTO orderDTO) {

		ResponseDTO<OrderConfirmationDTO> response = new ResponseDTO<OrderConfirmationDTO>();
		
		Orders order = new Orders();

		Branch branch = branchDAO.findById(Branch.class, orderDTO.getBranch()
				.getBranchId());
		ServingTable table = servingTableDAO.findById(ServingTable.class,
				orderDTO.getServingTableDTO().getServingTableId());
		Staff staff = staffDAO.findById(Staff.class, 1L);
		Customer customer = (Customer) customerDAO.findById(Customer.class, 1L);

		BigDecimal orderAmount = BigDecimal.valueOf(0);
		
		order.setBranch(branch);
		order.setCancellationReason("");
		order.setCustomer(customer);
		order.setDiscountAppliedPct(BigDecimal.valueOf(0));
		order.setOrderDate(new Date());
		order.setOrderItemAddons(null);
		order.setServingTable(table);
		order.setStaff(staff);

		List<OrderItemDTO> itemDTOList = orderDTO.getOrderItems();
		List<Item> itemList = new ArrayList<Item>();
		Set<OrderItems> orderItems = new HashSet<OrderItems>();
		OrderItems orderItem = null;
		ItemVariant itemVariant = null;
		BigDecimal qty = null;
		for (OrderItemDTO itemDTO : itemDTOList) {
			orderItem = new OrderItems();
			itemVariant = itemVariantDAO.findById(ItemVariant.class,itemDTO.getItemId());
			orderItem.setItemVariant(itemVariant);
			orderItem.setOrderPrice(itemVariant.getPrice());
			orderItem.setQuantity(itemDTO.getQuantity());
			orderItem.setSpecialRemarks("NA");
			orderItem.setOrders(order);
			orderItems.add(orderItem);
			qty = BigDecimal.valueOf(itemDTO.getQuantity());
			orderAmount.add(itemVariant.getPrice().multiply(qty));
			
		}

		order.setOrderItemses(orderItems);
		order.setOrderSpecialDealItems(null);
		order.setReferenceNum(generateOrderSeq());
		System.out.println("TOTAL ITEMS-->>>>" + orderItems.size());
		
		OrderConfirmationDTO confirmationDTO = new OrderConfirmationDTO();
		
		try{
		
			orderDAO.persist(order);
			confirmationDTO.setEsstimatedTime(30L);
			confirmationDTO.setOrderAmount(orderAmount);
			confirmationDTO.setOrderId(order.getOrderId());
			confirmationDTO.setOrderRef(order.getReferenceNum());
			response.setIsSuccess(true);
			response.setRequestType("New Order");
			response.setResponseCode("200");
			response.setModel(confirmationDTO);
		}catch (Exception e) {
			response.setIsSuccess(false);
			response.setRequestType("New Order");
			response.setResponseCode("450");
			response.setModel(confirmationDTO);
		}
		

		return response;
	}

	private String generateOrderSeq() {
		Long orderSeq = sequenceService
				.nextVal(SequenceHolderEnum.ORDER_REFERENCE);
		StringBuilder sequence = new StringBuilder();
		sequence.append(Utilities.currentDateAsString()).append("-")
				.append(orderSeq);
		return sequence.toString();
	}
}
