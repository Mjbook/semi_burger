package yb.order_list;
import java.util.*;
public class Order_listDAO {
	
	public Order_listDAO(){
		
	}
	
	public int checkMenu(String menu_name,Order_listDTO odto){
		ArrayList<Order_listDTO> arr=odto.getOdtos();
		if(arr!=null){
			for(int i=0;i<arr.size();i++){
				Order_listDTO temp=arr.get(i);
				if(menu_name.equals(temp.getItem_name())){
					return i;
				}
			}
		}
			return -1;
	}
	
}
