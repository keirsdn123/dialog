package net.su.dialog.formalModule.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import net.su.dialog.formalModule.domain.NaverShoppingVo;
import net.su.dialog.formalModule.domain.NewsExportModule;

public class NaverShoppingExportMaperImpl implements NaverShoppingExportMapper{
	private JdbcTemplate jdbcTemplate;
	
	public NaverShoppingExportMaperImpl() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:log4jdbc:mysql://localhost:3306/dialog2?autoReconnect=true&characterEncoding=UTF-8&serverTimezone=UTC&useUnicode=true&useSSL=false");
		dataSource.setUsername("root");
		dataSource.setPassword("1234");
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public List<NewsExportModule> selectNaverShoppingExportList() throws Exception{
		List<NewsExportModule> info = jdbcTemplate.query(""
				+ ""
				+ " SELECT 	member_code,"
				+ " 		d.data_export_request_code,"
				+ " 		d.data_code,"
				+ " 		export_collect_word,"
				+ "			export_collect_start_date,"					
				+ "			export_collect_end_date,"
				+ "			export_collect_status,"
				+ "			export_collect_date,"
				+ " 		regular_data_table_title,"
				+ "			m.data_export_management_code,"
				+ "			sche_code"				
				+ " FROM 	data_export_request d, regular_dataset r, data_export_management m,schedule_data_export s"
				+ "	WHERE   d.data_code = r.data_code"
				+ " AND 	d.data_export_request_code = m.data_export_request_code"
				+ " AND     m.data_export_management_code = s.data_export_management_code"
				+ " AND 	export_collect_status IN ('S')"
				+ " AND     export_collect_type = '네이버쇼핑'"
				+ " AND		r.root ='#'",
				new RowMapper<NewsExportModule>(){
					public NewsExportModule mapRow(ResultSet rs, int rowNum) throws SQLException {
						NewsExportModule info = new NewsExportModule();
						info.setMemberCode(rs.getInt("member_code"));
						info.setDateExportRequestCode(rs.getInt("data_export_request_code"));
						info.setDataCode(rs.getInt("data_code"));
						info.setExportCollectWord(rs.getString("export_collect_word"));
						info.setExportCollectStartDate(rs.getString("export_collect_start_date"));
						info.setExportCollectEndDate(rs.getString("export_collect_end_date"));
						info.setExportCollectStatus(rs.getString("export_collect_status"));
						info.setExportCollectDate(rs.getString("export_collect_date"));
						info.setRegularDataTableTitle(rs.getString("regular_data_table_title"));
						info.setScheCode(rs.getInt("sche_code"));
						info.setDataExportManagementCode(rs.getInt("data_export_management_code"));
						return info;
					}
				});
		return info;
	}
	
	
	public List<NaverShoppingVo> naverShoppingPhone(String tableNmae, String word, String startDate, String endDate) throws Exception{
		System.out.println("테이블명 확인" + tableNmae);
			System.out.println("phone@@@@@@@@@@@@@@@@@@@@@@@@@");
			List<NaverShoppingVo> info = jdbcTemplate.query(""
					+ ""
					+ " SELECT 	product.product_seq,"
					+ " 		product_category,"
					+ " 		product_nme,"
					+ " 		product_rank," 
					+ "  		product_date," 
					+ "  		screen_size," 
					+ "  		resolution,"
					+ "  		ram," 
					+ "  		embed_memory," 
					+ "  		external_memory_type," 
					+ "  		operating_system," 
					+ "  		agency," 
					+ "  		collection_date,"
					+ "  		product_url_adress" 
					+ " FROM 	phone_product_tb product, phone_tb phone, phone_date_tb phone_date"
					+ " WHERE	product.product_seq = phone.product_seq"
					+ " AND     product.product_seq = phone_date.product_seq"
					+ " AND     collection_date BETWEEN'"+ startDate  +"%' AND '" + endDate +"%'"
					+ " AND     product_nme LIKE'%" +word +"%'",
					new RowMapper<NaverShoppingVo>(){
						public NaverShoppingVo mapRow(ResultSet rs, int rowNum) throws SQLException {
							NaverShoppingVo info = new NaverShoppingVo();
							info.setPhoneSeq(rs.getInt("product_seq"));
							info.setProductKategorie(rs.getString("product_category"));
							info.setProductTitle(rs.getString("product_nme"));
							info.setProductRank(rs.getString("product_rank"));
							info.setProductRegisteredDate(rs.getString("product_date"));
							info.setPhoneScreenSize(rs.getString("screen_size"));
							info.setPhoneResolution(rs.getString("resolution"));
							info.setPhoneRam(rs.getString("ram"));
							info.setPhoneEmbedMemory(rs.getString("embed_memory"));
							info.setPhoneExternalMemoryType(rs.getString("external_memory_type"));
							info.setPhoneOperatingSystem(rs.getString("operating_system"));
							info.setPhoneAgency(rs.getString("agency"));
							info.setCollection_date(rs.getString("collection_date"));
							info.setProductUrlAdress(rs.getString("product_url_adress"));
							return info;
						}
					});
			return info;
	}
	
	public List<NaverShoppingVo> naverShoppingPhoneMall(String tableNmae, String word, String startDate, String endDate) throws Exception{
		System.out.println("테이블명 확인" + tableNmae);
			System.out.println("phone@@@@@@@@@@@@@@@@@@@@@@@@@");
			List<NaverShoppingVo> info = jdbcTemplate.query(""
					+ ""
					+ " SELECT 	mall_seq,"
					+ " 		mall_nme,"
					+ " 		mall_price,"
					+ " 		mall_good," 
					+ "  		mall_discount," 
					+ "  		mall_addition," 
					+ "  		mall_delivery_cost,"
					+ "  		mall_price_date," 
					+ "  		product_description," 
					+ " 	    collection_date,"
					+ "  		mall_url_address," 
					+ "  		phone_mall.product_seq" 
					+ " FROM 	phone_product_tb product, phone_mall_tb phone_mall,  phone_date_tb phone_date"
					+ " WHERE	product.product_seq = phone_mall.product_seq"
					+ " AND     product.product_seq = phone_date.product_seq"
					+ " AND     collection_date BETWEEN'"+ startDate  +"%' AND '" + endDate +"%'"
					+ " AND     product_nme LIKE'%" +word +"%'",
					new RowMapper<NaverShoppingVo>(){
						public NaverShoppingVo mapRow(ResultSet rs, int rowNum) throws SQLException {
							NaverShoppingVo info = new NaverShoppingVo();
							info.setMallSeq(rs.getInt("mall_seq"));
							info.setMallNme(rs.getString("mall_nme"));
							info.setMallPrice(rs.getString("mall_price"));
							info.setMallGood(rs.getString("mall_good"));
							info.setMallDiscount(rs.getString("mall_discount"));
							info.setMallAddition(rs.getString("mall_addition"));
							info.setMallDeliveryCost(rs.getString("mall_delivery_cost"));
							info.setMallPriceDate(rs.getString("mall_price_date"));
							info.setProductDescription(rs.getString("product_description"));
							info.setCollection_date(rs.getString("collection_date"));
							info.setMallUrlAddress(rs.getString("mall_url_address"));
							info.setPhoneSeq(rs.getInt("product_seq"));
							return info;
						}
					});
			return info;
	}
	
	public List<NaverShoppingVo> naverShoppingTablet(String tableNmae, String word, String startDate, String endDate) throws Exception{
		System.out.println("테이블명 확인" + tableNmae);
			System.out.println("phone@@@@@@@@@@@@@@@@@@@@@@@@@");
			List<NaverShoppingVo> info = jdbcTemplate.query(""
					+ ""
					+ " SELECT 	product.product_seq,"
					+ " 		product_category,"
					+ " 		product_nme,"
					+ " 		product_rank," 
					+ "  		product_date," 
					+ "  		tablet_screen_size," 
					+ "  		tablet_resolution,"
					+ "  		tablet_chipset_maker," 
					+ "  		tablet_series," 
					+ "  		tablet_wireless_lan," 
					+ "  		tablet_bluetooth," 
					+ "  		tablet_web_camera," 
					+ "  		tablet_weight," 
					+ "  		tablet_operating_system," 
					+ "  		collection_date,"
					+ "  		product_url_adress" 
					+ " FROM 	tablet_pc_product_tb product, tablet_pc_tb tablet, tablet_pc_date_tb tablet_date"
					+ " WHERE	product.product_seq = tablet.product_seq"
					+ " AND     product.product_seq = tablet_date.product_seq"
					+ " AND     collection_date BETWEEN'"+ startDate  +"%' AND '" + endDate +"%'"
					+ " AND     product_nme LIKE'%" +word +"%'",
					new RowMapper<NaverShoppingVo>(){
						public NaverShoppingVo mapRow(ResultSet rs, int rowNum) throws SQLException {
							NaverShoppingVo info = new NaverShoppingVo();
							info.setTabletSeq(rs.getInt("product_seq"));
							info.setProductKategorie(rs.getString("product_category"));
							info.setProductTitle(rs.getString("product_nme"));
							info.setProductRank(rs.getString("product_rank"));
							info.setProductRegisteredDate(rs.getString("product_date"));
							info.setTabletScreenSize(rs.getString("tablet_screen_size"));
							info.setTabletResolution(rs.getString("tablet_resolution"));
							info.setTabletChipset_maker(rs.getString("tablet_chipset_maker"));
							info.setTabletSeries(rs.getString("tablet_series"));
							info.setTabletWireless_lan(rs.getString("tablet_wireless_lan"));
							info.setTabletBluetooth(rs.getString("tablet_bluetooth"));
							info.setTabletWeb_camera(rs.getString("tablet_web_camera"));
							info.setTabletWeight(rs.getString("tablet_weight"));
							info.setTabletOperatingSystem(rs.getString("tablet_operating_system"));
							info.setCollection_date(rs.getString("collection_date"));
							info.setProductUrlAdress(rs.getString("product_url_adress"));
							return info;
						}
					});
			return info;
	}
	
	public List<NaverShoppingVo> naverShoppingTabletMall(String tableNmae, String word, String startDate, String endDate) throws Exception{
		System.out.println("테이블명 확인" + tableNmae);
			System.out.println("phone@@@@@@@@@@@@@@@@@@@@@@@@@");
			List<NaverShoppingVo> info = jdbcTemplate.query(""
					+ ""
					+ " SELECT 	mall_seq,"
					+ " 		mall_nme,"
					+ " 		mall_price,"
					+ " 		mall_good," 
					+ "  		mall_discount," 
					+ "  		mall_addition," 
					+ "  		mall_delivery_cost,"
					+ "  		mall_price_date," 
					+ "  		product_description," 
					+ " 	    collection_date,"
					+ "  		mall_url_address," 
					+ "  		tablet_mall.product_seq" 
					+ " FROM 	tablet_pc_product_tb product, tablet_pc_mall_tb tablet_mall,  tablet_pc_date_tb tablet_date"
					+ " WHERE	product.product_seq = tablet_mall.product_seq"
					+ " AND     product.product_seq = tablet_date.product_seq"
					+ " AND     collection_date BETWEEN'"+ startDate  +"%' AND '" + endDate +"%'"
					+ " AND     product_nme LIKE'%" +word +"%'",
					new RowMapper<NaverShoppingVo>(){
						public NaverShoppingVo mapRow(ResultSet rs, int rowNum) throws SQLException {
							NaverShoppingVo info = new NaverShoppingVo();
							info.setMallSeq(rs.getInt("mall_seq"));
							info.setMallNme(rs.getString("mall_nme"));
							info.setMallPrice(rs.getString("mall_price"));
							info.setMallGood(rs.getString("mall_good"));
							info.setMallDiscount(rs.getString("mall_discount"));
							info.setMallAddition(rs.getString("mall_addition"));
							info.setMallDeliveryCost(rs.getString("mall_delivery_cost"));
							info.setMallPriceDate(rs.getString("mall_price_date"));
							info.setProductDescription(rs.getString("product_description"));
							info.setCollection_date(rs.getString("collection_date"));
							info.setMallUrlAddress(rs.getString("mall_url_address"));
							info.setTabletSeq(rs.getInt("product_seq"));
							return info;
						}
					});
			return info;
	}
	
	public List<NaverShoppingVo> naverShoppingStorage(String tableNmae, String word, String startDate, String endDate) throws Exception{
		System.out.println("테이블명 확인" + tableNmae);
			System.out.println("phone@@@@@@@@@@@@@@@@@@@@@@@@@");
			List<NaverShoppingVo> info = jdbcTemplate.query(""
					+ ""
					+ " SELECT 	storage.product_seq,"
					+ " 		product_category,"
					+ " 		product_nme,"
					+ " 		product_rank," 
					+ "  		product_date," 
					+ "  		hdd_size," 
					+ "  		hdd_way,"
					+ "  		pc_connect_way," 
					+ "  		add_function," 
					+ "  		collection_date,"
					+ "  		product_url_adress" 
					+ " FROM 	storage_device_product_tb product, storage_device_tb storage, storage_device_date_tb storage_date"
					+ " WHERE	product.product_seq = storage.product_seq"
					+ " AND     product.product_seq = storage_date.product_seq"
					+ " AND     collection_date BETWEEN'"+ startDate  +"%' AND '" + endDate +"%'"
					+ " AND     product_nme LIKE'%" +word +"%'",
					new RowMapper<NaverShoppingVo>(){
						public NaverShoppingVo mapRow(ResultSet rs, int rowNum) throws SQLException {
							NaverShoppingVo info = new NaverShoppingVo();
							info.setStorageSeq(rs.getInt("product_seq"));
							info.setProductKategorie(rs.getString("product_category"));
							info.setProductTitle(rs.getString("product_nme"));
							info.setProductRank(rs.getString("product_rank"));
							info.setProductRegisteredDate(rs.getString("product_date"));
							info.setStorageHddSize(rs.getString("hdd_size"));
							info.setStorageHddWay(rs.getString("hdd_way"));
							info.setStoragePcConnectWay(rs.getString("pc_connect_way"));
							info.setStorageAddFunction(rs.getString("add_function"));
							info.setCollection_date(rs.getString("collection_date"));
							info.setProductUrlAdress(rs.getString("product_url_adress"));
							return info;
						}
					});
			return info;
	}
	
	public List<NaverShoppingVo> naverShoppingStorageMall(String tableNmae, String word, String startDate, String endDate) throws Exception{
		System.out.println("테이블명 확인" + tableNmae);
			System.out.println("phone@@@@@@@@@@@@@@@@@@@@@@@@@");
			List<NaverShoppingVo> info = jdbcTemplate.query(""
					+ ""
					+ " SELECT 	mall_seq,"
					+ " 		mall_nme,"
					+ " 		mall_price,"
					+ " 		mall_good," 
					+ "  		mall_discount," 
					+ "  		mall_addition," 
					+ "  		mall_delivery_cost,"
					+ "  		mall_price_date," 
					+ "  		product_description," 
					+ " 	    collection_date,"
					+ "  		mall_url_address," 
					+ "  		storage_mall.product_seq" 
					+ " FROM 	storage_device_product_tb product, storage_device_mall_tb storage_mall,  storage_device_date_tb storage_date"
					+ " WHERE	product.product_seq = storage_mall.product_seq"
					+ " AND     product.product_seq = storage_date.product_seq"
					+ " AND     collection_date BETWEEN'"+ startDate  +"%' AND '" + endDate +"%'"
					+ " AND     product_nme LIKE'%" +word +"%'",
					new RowMapper<NaverShoppingVo>(){
						public NaverShoppingVo mapRow(ResultSet rs, int rowNum) throws SQLException {
							NaverShoppingVo info = new NaverShoppingVo();
							info.setMallSeq(rs.getInt("mall_seq"));
							info.setMallNme(rs.getString("mall_nme"));
							info.setMallPrice(rs.getString("mall_price"));
							info.setMallGood(rs.getString("mall_good"));
							info.setMallDiscount(rs.getString("mall_discount"));
							info.setMallAddition(rs.getString("mall_addition"));
							info.setMallDeliveryCost(rs.getString("mall_delivery_cost"));
							info.setMallPriceDate(rs.getString("mall_price_date"));
							info.setProductDescription(rs.getString("product_description"));
							info.setCollection_date(rs.getString("collection_date"));
							info.setMallUrlAddress(rs.getString("mall_url_address"));
							info.setStorageSeq(rs.getInt("product_seq"));
							return info;
						}
					});
			return info;
	}
	
	public List<NaverShoppingVo> naverShoppingGraphic(String tableNmae, String word, String startDate, String endDate) throws Exception{
		System.out.println("테이블명 확인" + tableNmae);
			System.out.println("phone@@@@@@@@@@@@@@@@@@@@@@@@@");
			List<NaverShoppingVo> info = jdbcTemplate.query(""
					+ ""
					+ " SELECT 	graphic.product_seq,"
					+ " 		product_category,"
					+ " 		product_nme,"
					+ " 		product_rank," 
					+ "  		product_date," 
					+ "  		chipset," 
					+ "  		memory,"
					+ "  		memory_type," 
					+ "  		memory_bandwidth," 
					+ "  		memory_cluck,"
					+ "  		gpu_cluck,"
					+ "  		processor,"
					+ "  		graphic_interface,"
					+ "  		output_jack,"
					+ "  		stream_process,"
					+ "  		collection_date,"
					+ "  		product_url_adress" 
					+ " FROM graphic_card_product_tb product, graphic_card_tb graphic, graphic_card_date_tb graphic_date"
					+ " WHERE	product.product_seq = graphic.product_seq"
					+ " AND     product.product_seq = graphic_date.product_seq"
					+ " AND     collection_date BETWEEN'"+ startDate  +"%' AND '" + endDate +"%'"
					+ " AND     product_nme LIKE'%" +word +"%'",
					new RowMapper<NaverShoppingVo>(){
						public NaverShoppingVo mapRow(ResultSet rs, int rowNum) throws SQLException {
							NaverShoppingVo info = new NaverShoppingVo();
							info.setGraphiccardSeq(rs.getInt("product_seq"));
							info.setProductKategorie(rs.getString("product_category"));
							info.setProductTitle(rs.getString("product_nme"));
							info.setProductRank(rs.getString("product_rank"));
							info.setProductRegisteredDate(rs.getString("product_date"));
							info.setGraphiccardChipset(rs.getString("chipset"));
							info.setGraphiccardMemory(rs.getString("memory"));
							info.setGraphiccardMemoryType(rs.getString("memory_type"));
							info.setGraphiccardMemoryBandwidth(rs.getString("memory_bandwidth"));
							info.setGraphiccardMemoryCluck(rs.getString("memory_cluck"));
							info.setGraphiccardGpuCluck(rs.getString("gpu_cluck"));
							info.setGraphiccardProcessor(rs.getString("processor"));
							info.setGraphiccardInterface(rs.getString("graphic_interface"));
							info.setGraphiccardOutputJack(rs.getString("output_jack"));
							info.setGraphiccardStreamProcess(rs.getString("stream_process"));
							info.setCollection_date(rs.getString("collection_date"));
							info.setProductUrlAdress(rs.getString("product_url_adress"));
							return info;
						}
					});
			return info;
	}
	
	public List<NaverShoppingVo> naverShoppingGraphicMall(String tableNmae, String word, String startDate, String endDate) throws Exception{
		System.out.println("테이블명 확인" + tableNmae);
			System.out.println("phone@@@@@@@@@@@@@@@@@@@@@@@@@");
			List<NaverShoppingVo> info = jdbcTemplate.query(""
					+ ""
					+ " SELECT 	mall_seq,"
					+ " 		mall_nme,"
					+ " 		mall_price,"
					+ " 		mall_good," 
					+ "  		mall_discount," 
					+ "  		mall_addition," 
					+ "  		mall_delivery_cost,"
					+ "  		mall_price_date," 
					+ "  		product_description," 
					+ " 	    collection_date,"
					+ "  		mall_url_address," 
					+ "  		graphic_mall.product_seq" 
					+ " FROM    graphic_card_product_tb product, graphic_card_mall_tb graphic_mall,  graphic_card_date_tb graphic_date"
					+ " where   product.product_seq = graphic_mall.product_seq"
					+ " and     product.product_seq = graphic_date.product_seq"
					+ " AND     collection_date BETWEEN'"+ startDate  +"%' AND '" + endDate +"%'"
					+ " AND     product_nme LIKE'%" +word +"%'",
					new RowMapper<NaverShoppingVo>(){
						public NaverShoppingVo mapRow(ResultSet rs, int rowNum) throws SQLException {
							NaverShoppingVo info = new NaverShoppingVo();
							info.setMallSeq(rs.getInt("mall_seq"));
							info.setMallNme(rs.getString("mall_nme"));
							info.setMallPrice(rs.getString("mall_price"));
							info.setMallGood(rs.getString("mall_good"));
							info.setMallDiscount(rs.getString("mall_discount"));
							info.setMallAddition(rs.getString("mall_addition"));
							info.setMallDeliveryCost(rs.getString("mall_delivery_cost"));
							info.setMallPriceDate(rs.getString("mall_price_date"));
							info.setProductDescription(rs.getString("product_description"));
							info.setCollection_date(rs.getString("collection_date"));
							info.setMallUrlAddress(rs.getString("mall_url_address"));
							info.setGraphiccardSeq(rs.getInt("product_seq"));
							return info;
						}
					});
			return info;
	}
	
	public List<NaverShoppingVo> naverShoppingTV(String tableNmae, String word, String startDate, String endDate) throws Exception{
		System.out.println("테이블명 확인" + tableNmae);
			System.out.println("phone@@@@@@@@@@@@@@@@@@@@@@@@@");
			List<NaverShoppingVo> info = jdbcTemplate.query(""
					+ ""
					+ " SELECT 	tv.product_seq,"
					+ " 		product_category,"
					+ " 		product_nme,"
					+ " 		product_rank," 
					+ "  		product_date," 
					+ "  		tv_screen_size," 
					+ "  		tv_shape,"
					+ "  		tv_resolution," 
					+ "  		tv_aspect_ratio," 
					+ "  		tv_type,"
					+ "  		tv_terminal,"
					+ "  		tv_technique,"
					+ "  		tv_energy_efficiency,"
					+ "  		tv_power_consumption,"
					+ "  		tv_brightness,"
					+ "  		tv_back_light,"
					+ "  		collection_date,"
					+ "  		product_url_adress" 
					+ " FROM 	tv_product_tb product, tv_tb tv, tv_date_tb tv_date"
					+ " WHERE	product.product_seq = tv.product_seq"
					+ " AND     product.product_seq = tv_date.product_seq"
					+ " AND     collection_date BETWEEN'"+ startDate  +"%' AND '" + endDate +"%'"
					+ " AND     product_nme LIKE'%" +word +"%'",
					new RowMapper<NaverShoppingVo>(){
						public NaverShoppingVo mapRow(ResultSet rs, int rowNum) throws SQLException {
							NaverShoppingVo info = new NaverShoppingVo();
							info.setTvSeq(rs.getInt("product_seq"));
							info.setProductKategorie(rs.getString("product_category"));
							info.setProductTitle(rs.getString("product_nme"));
							info.setProductRank(rs.getString("product_rank"));
							info.setProductRegisteredDate(rs.getString("product_date"));
							info.setTvScreenSize(rs.getString("tv_screen_size"));
							info.setTvShape(rs.getString("tv_shape"));
							info.setTvResolution(rs.getString("tv_resolution"));
							info.setTvAspectRatio(rs.getString("tv_aspect_ratio"));
							info.setTvType(rs.getString("tv_type"));
							info.setTvTerminal(rs.getString("tv_terminal"));
							info.setTvTechnique(rs.getString("tv_technique"));
							info.setTvEnergyEfficiency(rs.getString("tv_energy_efficiency"));
							info.setTvPowerConsumption(rs.getString("tv_power_consumption"));
							info.setTvBrightness(rs.getString("tv_brightness"));
							info.setTvBackLight(rs.getString("tv_back_light"));
							info.setCollection_date(rs.getString("collection_date"));
							info.setProductUrlAdress(rs.getString("product_url_adress"));
							return info;
						}
					});
			return info;
	}
	
	public List<NaverShoppingVo> naverShoppingTvMall(String tableNmae, String word, String startDate, String endDate) throws Exception{
		System.out.println("테이블명 확인" + tableNmae);
			System.out.println("phone@@@@@@@@@@@@@@@@@@@@@@@@@");
			List<NaverShoppingVo> info = jdbcTemplate.query(""
					+ ""
					+ " SELECT 	mall_seq,"
					+ " 		mall_nme,"
					+ " 		mall_price,"
					+ " 		mall_good," 
					+ "  		mall_discount," 
					+ "  		mall_addition," 
					+ "  		mall_delivery_cost,"
					+ "  		mall_price_date," 
					+ "  		product_description," 
					+ " 	    collection_date,"
					+ "  		mall_url_address," 
					+ "  		tv_mall.product_seq" 
					+ " FROM    tv_product_tb product, tv_mall_tb tv_mall,  tv_date_tb tv_date"
					+ " where   product.product_seq = tv_mall.product_seq"
					+ " and     product.product_seq = tv_date.product_seq"
					+ " AND     collection_date BETWEEN'"+ startDate  +"%' AND '" + endDate +"%'"
					+ " AND     product_nme LIKE'%" +word +"%'",
					new RowMapper<NaverShoppingVo>(){
						public NaverShoppingVo mapRow(ResultSet rs, int rowNum) throws SQLException {
							NaverShoppingVo info = new NaverShoppingVo();
							info.setMallSeq(rs.getInt("mall_seq"));
							info.setMallNme(rs.getString("mall_nme"));
							info.setMallPrice(rs.getString("mall_price"));
							info.setMallGood(rs.getString("mall_good"));
							info.setMallDiscount(rs.getString("mall_discount"));
							info.setMallAddition(rs.getString("mall_addition"));
							info.setMallDeliveryCost(rs.getString("mall_delivery_cost"));
							info.setMallPriceDate(rs.getString("mall_price_date"));
							info.setProductDescription(rs.getString("product_description"));
							info.setCollection_date(rs.getString("collection_date"));
							info.setMallUrlAddress(rs.getString("mall_url_address"));
							info.setTvSeq(rs.getInt("product_seq"));
							return info;
						}
					});
			return info;
	}
}
