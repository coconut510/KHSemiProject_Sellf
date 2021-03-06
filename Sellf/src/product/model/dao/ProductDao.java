package product.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import common.JDBCTemplate;
//import product.model.vo.ImageFile;
import product.model.vo.Product;
import product.model.vo.SellerRate;

public class ProductDao {
//
//	public int uploadFile(Connection conn, ImageFile imgFile) {
//		PreparedStatement pstmt = null;
//		int result = 0;
//		
//		String query = "insert into filetbl2 values(?,?,?,?,?,?)";
//		try {
//			
//			pstmt = conn.prepareStatement(query);
////			pstmt.setString(1, imgFile.getFileNewName());
////			pstmt.setString(2, imgFile.getFileOriginName());
////			pstmt.setString(3, imgFile.getFilePath());
////			pstmt.setLong(4, imgFile.getFileSize());
////			pstmt.setString(5, imgFile.getUserId());
////			pstmt.setTimestamp(6, imgFile.getUploadTime());			
//			result = pstmt.executeUpdate();
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		finally {
//			JDBCTemplate.close(pstmt);
//		}
//		
//		return result;	
//	}

	public ArrayList<Product> productSortCategory(Connection conn,String searchKey, String subCategory,int onePageShowProduct, int currentPage, String orderType) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> resultList = new ArrayList<Product>();
		String orderQuery = "";
		String whereQuery = "";
		int queryPar = 1;
		if(orderType==null)orderType = "uploadOrder";
		switch(orderType)
		{
			case "uploadOrder": orderQuery = " order by product_entire_pk desc "; break;
			case "lowPriceOrder": orderQuery = " order by product_price ";  break;
			case "highPriceOrder": orderQuery = " order by product_price desc ";  break;
			case "manyReviewOrder": orderQuery = " order by product_entire_pk desc ";  break;		
		}
		if(searchKey.length()>0)whereQuery += " where product_name like ? ";
	
		if(subCategory.length()>0 ) {
			if(whereQuery.length()>0) whereQuery +=" and ";
			else whereQuery+=" where ";
			whereQuery +=" PRODUCT_ENTIRE_CATE_SUB_ID_FK = ? ";
		}
		String query = "select * from product_entire_tb"+whereQuery +orderQuery;
		
		System.out.println(searchKey + " " + subCategory + " 서브 " + query );
		
		try {
			pstmt = conn.prepareStatement(query);
			if(searchKey.length()>0)   pstmt.setString(queryPar++, "%" + searchKey+"%");
			if(subCategory.length()>0 )pstmt.setString(queryPar++, subCategory);
//			pstmt.setInt(3, currentPage*onePageShowProduct);
//			pstmt.setInt(4, currentPage*onePageShowProduct + onePageShowProduct);
			rset = pstmt.executeQuery();
			while(rset.next())
			{
				Product p = new Product();
				p.setProduct_entire_pk(rset.getInt("PRODUCT_ENTIRE_PK"));
				p.setProduct_entire_user_entire_id_fk(rset.getString("PRODUCT_ENTIRE_USER_ID_FK"));
				p.setProduct_entire_category_main_id_fk(rset.getString("PRODUCT_ENTIRE_CATE_MAIN_ID_FK"));
				p.setProduct_entire_category_sub_id_fk(rset.getString("PRODUCT_ENTIRE_CATE_SUB_ID_FK"));
				p.setProduct_name(rset.getString("PRODUCT_NAME"));
				p.setProduct_price(rset.getInt("PRODUCT_PRICE"));
				p.setProduct_image(rset.getString("PRUDUCT_IMAGE")==null?"":rset.getString("PRUDUCT_IMAGE"));
				p.setProduct_amount(rset.getInt("PRODUCT_AMOUNT"));
				p.setProduct_state(rset.getString("PRODUCT_STATE"));	
				p.setProduct_detail(rset.getString("PRODUCT_DETAIL"));
				p.setProduct_oldnew(rset.getString("PRODUCT_OLDNEW"));
				resultList.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return resultList;
	}

	public Product selectOneProduct(Connection conn, int productPk) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product p = null;
		String query ="select * from product_entire_tb where PRODUCT_ENTIRE_PK = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productPk);
			rset = pstmt.executeQuery();
			if(rset.next())
			{
				p = new Product();
				p.setProduct_entire_pk(rset.getInt("PRODUCT_ENTIRE_PK"));
				p.setProduct_entire_user_entire_id_fk(rset.getString("PRODUCT_ENTIRE_USER_ID_FK"));
				p.setProduct_entire_category_main_id_fk(rset.getString("PRODUCT_ENTIRE_CATE_MAIN_ID_FK"));
				p.setProduct_entire_category_sub_id_fk(rset.getString("PRODUCT_ENTIRE_CATE_SUB_ID_FK"));
				p.setProduct_name(rset.getString("PRODUCT_NAME"));
				p.setProduct_price(rset.getInt("PRODUCT_PRICE"));
				p.setProduct_image(rset.getString("PRUDUCT_IMAGE")==null?"":rset.getString("PRUDUCT_IMAGE"));
				p.setProduct_amount(rset.getInt("PRODUCT_AMOUNT"));
				p.setProduct_state(rset.getString("PRODUCT_STATE"));	
				p.setProduct_detail(rset.getString("PRODUCT_DETAIL"));
				p.setProduct_oldnew(rset.getString("PRODUCT_OLDNEW"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return p;
	}

	public SellerRate raputationAvr(Connection conn, String sellerId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		SellerRate sellerRate = null;
		String query ="select count(*) as total, sum(USER_REVIEW_RATING) as score"
				+ " from user_review_tb where USER_RV_USER_ENTIRE_ID_FK =?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, sellerId);
			rset = pstmt.executeQuery();
			
			if(rset.next())
			{
				sellerRate = new SellerRate();
				sellerRate.setTotalCount(rset.getInt("total"));
				int sumScore = rset.getInt("score");
				sellerRate.setAvr(0);
				if(sellerRate.getTotalCount()>0 && sumScore>0) {
					sellerRate.setAvr(sumScore*1.0/sellerRate.getTotalCount());
				}
			}		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return sellerRate;
	}

	public ArrayList<Product> productRecomandList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> resultList = new ArrayList<Product>();
		String query = "select * from product_entire_tb where ROWNUM<=4 order by PRODUCT_OLDNEW";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next())
			{
				Product p = new Product();
				p.setProduct_entire_pk(rset.getInt("PRODUCT_ENTIRE_PK"));
				p.setProduct_entire_user_entire_id_fk(rset.getString("PRODUCT_ENTIRE_USER_ID_FK"));
				p.setProduct_entire_category_main_id_fk(rset.getString("PRODUCT_ENTIRE_CATE_MAIN_ID_FK"));
				p.setProduct_entire_category_sub_id_fk(rset.getString("PRODUCT_ENTIRE_CATE_SUB_ID_FK"));
				p.setProduct_name(rset.getString("PRODUCT_NAME"));
				p.setProduct_price(rset.getInt("PRODUCT_PRICE"));
				p.setProduct_image(rset.getString("PRUDUCT_IMAGE")==null?"":rset.getString("PRUDUCT_IMAGE"));
				p.setProduct_amount(rset.getInt("PRODUCT_AMOUNT"));
				p.setProduct_state(rset.getString("PRODUCT_STATE"));	
				p.setProduct_detail(rset.getString("PRODUCT_DETAIL"));
				p.setProduct_oldnew(rset.getString("PRODUCT_OLDNEW"));
				resultList.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return resultList;
		
	}

	public int productAddCart(Connection conn, String user_id, int productId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into USER_WISHLIST_TB values(USER_WISHLIST_TB_SEQ.nextval, ?,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productId);
			pstmt.setString(2, user_id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

}
