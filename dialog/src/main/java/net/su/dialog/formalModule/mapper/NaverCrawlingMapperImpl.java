package net.su.dialog.formalModule.mapper;

import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.support.TransactionSynchronizationManager;

import net.su.dialog.formalModule.domain.NaverShoppingVo;

//@Repository("net.su.dialog.formalModule.mapper.NaverCrawlingMapper")
public class NaverCrawlingMapperImpl implements NaverCrawlingMapper {

	public  void getDb () {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:log4jdbc:mysql://localhost:3306/dialog2?autoReconnect=true&characterEncoding=UTF-8&serverTimezone=UTC&useUnicode=true&useSSL=false");
        dataSource.setUsername("root");
        dataSource.setPassword("1234");
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.insertActor = new SimpleJdbcInsert(dataSource);
	}
	private JdbcTemplate jdbcTemplate;
	private SimpleJdbcInsert insertActor;
	
	//제품 중복 확인
		public int isProductPresent(NaverShoppingVo naverShoppingVo, String tableName) {
			getDb();
			String nowDate = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
			String sql=""
					+ " SELECT	count(*)" 
					+ "	FROM(" 
					+ "			SELECT	p.product_seq" 
					+ "			FROM	"+tableName +"_product_tb p, "+tableName+"_date_tb d" 
					+ "		    WHERE 	p.product_nme = ?" 
					+ "		    AND		p.product_seq = d.product_seq" 
					+ "			AND 	p.product_date = ?" 
					+ "		    AND		date_format(d.collection_date,'%Y%m%d') like ?" 
					+ "		    AND		p.mall_count = ?"
					+ "		    )count";
			
			int checkCount = jdbcTemplate.queryForObject(sql,new Object[] {	naverShoppingVo.getProductTitle()
																			,naverShoppingVo.getProductRegisteredDate()
																			,nowDate
																			,naverShoppingVo.getProductMallCount()}
																			,Integer.class);
			return checkCount;
		}
		
		//제품 등록
		public int insertShopList(NaverShoppingVo naverShoppingVo, String tableName) {
			getDb();
			insertActor.withTableName(tableName).usingGeneratedKeyColumns("product_seq");
			Map<String, Object> parameters = new HashMap<String, Object>();
	        parameters.put("product_category", naverShoppingVo.getProductKategorie());
	        parameters.put("product_nme", naverShoppingVo.getProductTitle());
	        parameters.put("product_rank", naverShoppingVo.getProductRank());
	        parameters.put("product_date", naverShoppingVo.getProductRegisteredDate());
	        parameters.put("product_url_adress", naverShoppingVo.getProductUrlAdress());
	        parameters.put("mall_count", naverShoppingVo.getProductMallCount());
	        int productSeq = insertActor.executeAndReturnKey(parameters).intValue();
	        return productSeq;
		}
		//수집시간 등록
		public void insertCrawlingDate(NaverShoppingVo naverShoppingVo, int seq, String tableName) {
			getDb();
			jdbcTemplate.update(""
					+ " INSERT INTO " +tableName+ " (date_seq"
					+ "							  , collection_date"
					+ "							  , product_seq)"
					+ "	VALUES					( null"
					+ "							, default"
					+ "							, "+seq+")");
		}
		//판매처 등록
		public void insertNaverMall(NaverShoppingVo naverShoppingVo, int seq, String tableName) {
			getDb();
			insertActor.withTableName(tableName);
			Map<String, Object> parameters = new HashMap<String, Object>();
	        parameters.put("mall_nme", naverShoppingVo.getMallNme());
	        parameters.put("mall_price", naverShoppingVo.getMallPrice());
	        parameters.put("mall_good", naverShoppingVo.getMallGood());
	        parameters.put("mall_discount", naverShoppingVo.getMallDiscount());
	        parameters.put("mall_addition", naverShoppingVo.getMallAddition());
	        parameters.put("mall_delivery_cost", naverShoppingVo.getMallDeliveryCost());
	        parameters.put("mall_price_date", naverShoppingVo.getMallPriceDate());
	        parameters.put("product_description", naverShoppingVo.getProductDescription());
	        parameters.put("mall_url_address", naverShoppingVo.getMallUrlAddress());
	        parameters.put("product_seq", seq);
	        insertActor.execute(parameters);
		}
		//휴대폰 스펙 등록
		public void specInsertPhone(NaverShoppingVo naverShoppingVo, int seq) {
			getDb();
			insertActor.withTableName("phone_tb");
			Map<String, Object> parameters = new HashMap<String, Object>();
	        parameters.put("screen_size", naverShoppingVo.getPhoneScreenSize());
	        parameters.put("resolution", naverShoppingVo.getPhoneResolution());
	        parameters.put("ram", naverShoppingVo.getPhoneRam());
	        parameters.put("embed_memory", naverShoppingVo.getPhoneEmbedMemory());
	        parameters.put("external_memory_type", naverShoppingVo.getPhoneExternalMemoryType());
	        parameters.put("operating_system", naverShoppingVo.getPhoneOperatingSystem());
	        parameters.put("agency", naverShoppingVo.getPhoneAgency());
	        parameters.put("product_seq", seq);
	        insertActor.execute(parameters);
		}
		//저장장치 스펙 등록
		public void specInsertStorageDevice(NaverShoppingVo naverShoppingVo, int seq) {
			getDb();
			insertActor.withTableName("storage_device_tb");
			Map<String, Object> parameters = new HashMap<String, Object>();
	        parameters.put("hdd_size", naverShoppingVo.getStorageHddSize());
	        parameters.put("hdd_way", naverShoppingVo.getStorageHddWay());
	        parameters.put("pc_connect_way", naverShoppingVo.getStoragePcConnectWay());
	        parameters.put("add_function", naverShoppingVo.getStorageAddFunction());
	        parameters.put("product_seq", seq);
	        insertActor.execute(parameters);
		}
		//태블렛 pc 스펙 등록
		public void specInsertTabletPc(NaverShoppingVo naverShoppingVo, int seq) {
			getDb();
			insertActor.withTableName("tablet_pc_tb");
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("tablet_screen_size", naverShoppingVo.getTabletScreenSize());
			parameters.put("tablet_resolution", naverShoppingVo.getTabletResolution());
			parameters.put("tablet_chipset_maker", naverShoppingVo.getTabletChipset_maker());
			parameters.put("tablet_series", naverShoppingVo.getTabletSeries());
			parameters.put("tablet_wireless_lan", naverShoppingVo.getTabletWireless_lan());
			parameters.put("tablet_bluetooth", naverShoppingVo.getTabletBluetooth());
			parameters.put("tablet_web_camera", naverShoppingVo.getTabletWeb_camera());
			parameters.put("tablet_weight", naverShoppingVo.getTabletWeight());
			parameters.put("tablet_operating_system", naverShoppingVo.getTabletOperatingSystem());
			parameters.put("product_seq", seq);
			insertActor.execute(parameters);
		}
		//그래픽 카드 스펙 등록
		public void specInsertgraphicCard(NaverShoppingVo naverShoppingVo, int seq) {
			getDb();
			insertActor.withTableName("graphic_card_tb");
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("chipset", naverShoppingVo.getGraphiccardChipset());
			parameters.put("memory", naverShoppingVo.getGraphiccardMemory());
			parameters.put("memory_type", naverShoppingVo.getGraphiccardMemoryType());
			parameters.put("memory_bandwidth", naverShoppingVo.getGraphiccardMemoryBandwidth());
			parameters.put("memory_cluck", naverShoppingVo.getGraphiccardMemoryCluck());
			parameters.put("gpu_cluck", naverShoppingVo.getGraphiccardGpuCluck());
			parameters.put("processor", naverShoppingVo.getGraphiccardProcessor());
			parameters.put("graphic_interface", naverShoppingVo.getGraphiccardInterface());
			parameters.put("output_jack", naverShoppingVo.getGraphiccardOutputJack());
			parameters.put("stream_process", naverShoppingVo.getGraphiccardStreamProcess());
			parameters.put("product_seq", seq);
			insertActor.execute(parameters);
		}
		//TV 스펙 등록
		public void specInsertTv(NaverShoppingVo naverShoppingVo, int seq) {
			getDb();
			insertActor.withTableName("tv_tb");
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("tv_screen_size", naverShoppingVo.getTvScreenSize());
			parameters.put("tv_shape", naverShoppingVo.getTvShape());
			parameters.put("tv_resolution", naverShoppingVo.getTvResolution());
			parameters.put("tv_aspect_ratio", naverShoppingVo.getTvAspectRatio());
			parameters.put("tv_type", naverShoppingVo.getTvType());
			parameters.put("tv_terminal", naverShoppingVo.getTvTerminal());
			parameters.put("tv_technique", naverShoppingVo.getTvTechnique());
			parameters.put("tv_energy_efficiency", naverShoppingVo.getTvEnergyEfficiency());
			parameters.put("tv_power_consumption", naverShoppingVo.getTvPowerConsumption());
			parameters.put("tv_brightness", naverShoppingVo.getTvBrightness());
			parameters.put("tv_back_light", naverShoppingVo.getTvBackLight());
			parameters.put("product_seq", seq);
			insertActor.execute(parameters);
		}
}
