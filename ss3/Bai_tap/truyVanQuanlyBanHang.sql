use sell_management;
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oId,oDate,oTotalPrice 
from orders;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select customer.cName, product.pName
from (customer join orders on customer.cId = orders.cId)
join orders_detail on orders_detail.oId = orders.oId
join product on product.pId = orders_detail.pId;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select * from customer
left join orders on orders.cId = customer.cId
where orders.cId is null; 
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
-- Giá bán của từng loại được tính = odQTY*pPrice)
select orders.oId, orders.oDate, orders_detail.odQTY*product.pPrice as total_amount
from orders join orders_detail on orders.oId = orders_detail.oId
join product on product.pId = orders_detail.pId;