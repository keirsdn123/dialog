package net.su.dialog.schedule.domain;

public class NaverShopping {
	private int product_seq;// seq
	private String product_url_adress=null;// 상세보기 링크주소
	private String mallRank=null; //순위
	private String productTitle=null; //제품명
	private String price=null; //가격
	private String kategorie=null; //카테고리
	private String detail=null; //상세정보 스팩
	private String starPoint=null; //별점
	private String date=null; //등록날짜
	private String mallInfo=null; //쇼핑몰 정보
	private String optionInfo=null; //추가 옵션 정보
	private String countStar=null; //평점 참여자 수
	private String countBook=null; //찜하기 수
	private String mall_count=null;//판매처 수
	private String url=null;//url
	//날짜
	private int date_seq;
	private String collection_date;
	//판매처
	private int mall_seq;
	private String mall_nme=null; //판매처 이름
	private String mall_price=null;//제품 가격
	private String mall_good =null;//제품 찜하기
	private String mall_discount=null;//제품 할인정보
	private String mall_addition=null;//제품 부가정보
	private String mall_option=null; //제품 옵션
	private String mall_price_date=null; //제품 등록일
	private String mall_delivery_cost=null; //제품 배송료
	private String mall_url_address=null;
	private String product_description=null; //제품 상세 설명
	//휴대폰 스펙
	private int phone_seq; //휴대폰 seq
	private String screen_size=null; //화면크기
	private String resolution=null; // 해상도
	private String ram=null; //RAM
	private String embed_memory=null; // 내장메모리
	private String external_memory_type=null; //외장메모리 타입
	private String operatingSystem=null; //운영체제
	private String agency=null; //통신사
	//그래픽카드 스펙 
	private int graphiccard_seq; //그래픽카드 seq
	private String chipset=null; //칩셋
	private String memory_type=null; // 메모리 종류
	private String memory=null; //메모리
	private String memory_bandwidth=null; // 메모리 대역폭
	private String memory_cluck=null; //메모리 클럭
	private String processor=null; //프로세서
	private String graphic_interface=null; //인터페이스
	private String output_jack=null; //출력단자
	private String gpu_cluck=null;// gpu 클럭
	private String stream_process=null;// 스트림 프로세스
	//저장장치 스펙
	private int storage_seq; //저장장치 seq
	private String hdd_size=null;  //HDD 사이즈
	private String hdd_way=null; //HDD방식
	private String pc_connect_way=null; //PC연결 방식
	private String add_function=null; //부가기능
	private String send_speed=null; //전송 속도
	private String storage_kategorie=null;
	//태블릿 pc 스펙
	private int tablet_seq;
	private String tablet_screen_size = null;
	private String tablet_resolution=null;
	private String tablet_chipset_maker = null;
	private String tablet_series = null;
	private String tablet_wireless_lan = null;
	private String tablet_bluetooth = null;
	private String tablet_web_camera = null;
	private String tablet_weight = null;
	//리뷰
	private int review_seq;
	private String review_title=null;
	private String review_content=null;
	private String review_grade=null;
	private String review_date=null;
	//review detail
	private String avgGrade = null; //평균 평점
	private String reviewTotalCnt = null; //총 리뷰수
	private String ratePoint5 = null; //5점 비율
	private String ratePoint4 = null; //4점 비율
	private String ratePoint3 = null; //3점 비율
	private String ratePoint2 = null; //2점 비율
	private String ratePoint1 = null; //1점 비율
	//image 
	private int image_seq;
	private String image_nme = null;
	private String image_address = null;
	private String image_vertical = null;
	private String image_horizontal = null;
	private String image_type = null;
	
	//크롤링 수집 날짜
	private String crawling_date =null;

	public int getProduct_seq() {
		return product_seq;
	}

	public void setProduct_seq(int product_seq) {
		this.product_seq = product_seq;
	}

	public String getProduct_url_adress() {
		return product_url_adress;
	}

	public void setProduct_url_adress(String product_url_adress) {
		this.product_url_adress = product_url_adress;
	}

	public String getMallRank() {
		return mallRank;
	}

	public void setMallRank(String mallRank) {
		this.mallRank = mallRank;
	}

	public String getProductTitle() {
		return productTitle;
	}

	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getKategorie() {
		return kategorie;
	}

	public void setKategorie(String kategorie) {
		this.kategorie = kategorie;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getStarPoint() {
		return starPoint;
	}

	public void setStarPoint(String starPoint) {
		this.starPoint = starPoint;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getMallInfo() {
		return mallInfo;
	}

	public void setMallInfo(String mallInfo) {
		this.mallInfo = mallInfo;
	}

	public String getOptionInfo() {
		return optionInfo;
	}

	public void setOptionInfo(String optionInfo) {
		this.optionInfo = optionInfo;
	}

	public String getCountStar() {
		return countStar;
	}

	public void setCountStar(String countStar) {
		this.countStar = countStar;
	}

	public String getCountBook() {
		return countBook;
	}

	public void setCountBook(String countBook) {
		this.countBook = countBook;
	}

	public String getMall_count() {
		return mall_count;
	}

	public void setMall_count(String mall_count) {
		this.mall_count = mall_count;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getDate_seq() {
		return date_seq;
	}

	public void setDate_seq(int date_seq) {
		this.date_seq = date_seq;
	}

	public String getCollection_date() {
		return collection_date;
	}

	public void setCollection_date(String collection_date) {
		this.collection_date = collection_date;
	}

	public int getMall_seq() {
		return mall_seq;
	}

	public void setMall_seq(int mall_seq) {
		this.mall_seq = mall_seq;
	}

	public String getMall_nme() {
		return mall_nme;
	}

	public void setMall_nme(String mall_nme) {
		this.mall_nme = mall_nme;
	}

	public String getMall_price() {
		return mall_price;
	}

	public void setMall_price(String mall_price) {
		this.mall_price = mall_price;
	}

	public String getMall_good() {
		return mall_good;
	}

	public void setMall_good(String mall_good) {
		this.mall_good = mall_good;
	}

	public String getMall_discount() {
		return mall_discount;
	}

	public void setMall_discount(String mall_discount) {
		this.mall_discount = mall_discount;
	}

	public String getMall_addition() {
		return mall_addition;
	}

	public void setMall_addition(String mall_addition) {
		this.mall_addition = mall_addition;
	}

	public String getMall_option() {
		return mall_option;
	}

	public void setMall_option(String mall_option) {
		this.mall_option = mall_option;
	}

	public String getMall_price_date() {
		return mall_price_date;
	}

	public void setMall_price_date(String mall_price_date) {
		this.mall_price_date = mall_price_date;
	}

	public String getMall_delivery_cost() {
		return mall_delivery_cost;
	}

	public void setMall_delivery_cost(String mall_delivery_cost) {
		this.mall_delivery_cost = mall_delivery_cost;
	}

	public String getMall_url_address() {
		return mall_url_address;
	}

	public void setMall_url_address(String mall_url_address) {
		this.mall_url_address = mall_url_address;
	}

	public String getProduct_description() {
		return product_description;
	}

	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}

	public int getPhone_seq() {
		return phone_seq;
	}

	public void setPhone_seq(int phone_seq) {
		this.phone_seq = phone_seq;
	}

	public String getScreen_size() {
		return screen_size;
	}

	public void setScreen_size(String screen_size) {
		this.screen_size = screen_size;
	}

	public String getResolution() {
		return resolution;
	}

	public void setResolution(String resolution) {
		this.resolution = resolution;
	}

	public String getRam() {
		return ram;
	}

	public void setRam(String ram) {
		this.ram = ram;
	}

	public String getEmbed_memory() {
		return embed_memory;
	}

	public void setEmbed_memory(String embed_memory) {
		this.embed_memory = embed_memory;
	}

	public String getExternal_memory_type() {
		return external_memory_type;
	}

	public void setExternal_memory_type(String external_memory_type) {
		this.external_memory_type = external_memory_type;
	}

	public String getOperatingSystem() {
		return operatingSystem;
	}

	public void setOperatingSystem(String operatingSystem) {
		this.operatingSystem = operatingSystem;
	}

	public String getAgency() {
		return agency;
	}

	public void setAgency(String agency) {
		this.agency = agency;
	}

	public int getGraphiccard_seq() {
		return graphiccard_seq;
	}

	public void setGraphiccard_seq(int graphiccard_seq) {
		this.graphiccard_seq = graphiccard_seq;
	}

	public String getChipset() {
		return chipset;
	}

	public void setChipset(String chipset) {
		this.chipset = chipset;
	}

	public String getMemory_type() {
		return memory_type;
	}

	public void setMemory_type(String memory_type) {
		this.memory_type = memory_type;
	}

	public String getMemory() {
		return memory;
	}

	public void setMemory(String memory) {
		this.memory = memory;
	}

	public String getMemory_bandwidth() {
		return memory_bandwidth;
	}

	public void setMemory_bandwidth(String memory_bandwidth) {
		this.memory_bandwidth = memory_bandwidth;
	}

	public String getMemory_cluck() {
		return memory_cluck;
	}

	public void setMemory_cluck(String memory_cluck) {
		this.memory_cluck = memory_cluck;
	}

	public String getProcessor() {
		return processor;
	}

	public void setProcessor(String processor) {
		this.processor = processor;
	}

	public String getGraphic_interface() {
		return graphic_interface;
	}

	public void setGraphic_interface(String graphic_interface) {
		this.graphic_interface = graphic_interface;
	}

	public String getOutput_jack() {
		return output_jack;
	}

	public void setOutput_jack(String output_jack) {
		this.output_jack = output_jack;
	}

	public String getGpu_cluck() {
		return gpu_cluck;
	}

	public void setGpu_cluck(String gpu_cluck) {
		this.gpu_cluck = gpu_cluck;
	}

	public String getStream_process() {
		return stream_process;
	}

	public void setStream_process(String stream_process) {
		this.stream_process = stream_process;
	}

	public int getStorage_seq() {
		return storage_seq;
	}

	public void setStorage_seq(int storage_seq) {
		this.storage_seq = storage_seq;
	}

	public String getHdd_size() {
		return hdd_size;
	}

	public void setHdd_size(String hdd_size) {
		this.hdd_size = hdd_size;
	}

	public String getHdd_way() {
		return hdd_way;
	}

	public void setHdd_way(String hdd_way) {
		this.hdd_way = hdd_way;
	}

	public String getPc_connect_way() {
		return pc_connect_way;
	}

	public void setPc_connect_way(String pc_connect_way) {
		this.pc_connect_way = pc_connect_way;
	}

	public String getAdd_function() {
		return add_function;
	}

	public void setAdd_function(String add_function) {
		this.add_function = add_function;
	}

	public String getSend_speed() {
		return send_speed;
	}

	public void setSend_speed(String send_speed) {
		this.send_speed = send_speed;
	}

	public String getStorage_kategorie() {
		return storage_kategorie;
	}

	public void setStorage_kategorie(String storage_kategorie) {
		this.storage_kategorie = storage_kategorie;
	}

	public int getTablet_seq() {
		return tablet_seq;
	}

	public void setTablet_seq(int tablet_seq) {
		this.tablet_seq = tablet_seq;
	}

	public String getTablet_screen_size() {
		return tablet_screen_size;
	}

	public void setTablet_screen_size(String tablet_screen_size) {
		this.tablet_screen_size = tablet_screen_size;
	}

	public String getTablet_resolution() {
		return tablet_resolution;
	}

	public void setTablet_resolution(String tablet_resolution) {
		this.tablet_resolution = tablet_resolution;
	}

	public String getTablet_chipset_maker() {
		return tablet_chipset_maker;
	}

	public void setTablet_chipset_maker(String tablet_chipset_maker) {
		this.tablet_chipset_maker = tablet_chipset_maker;
	}

	public String getTablet_series() {
		return tablet_series;
	}

	public void setTablet_series(String tablet_series) {
		this.tablet_series = tablet_series;
	}

	public String getTablet_wireless_lan() {
		return tablet_wireless_lan;
	}

	public void setTablet_wireless_lan(String tablet_wireless_lan) {
		this.tablet_wireless_lan = tablet_wireless_lan;
	}

	public String getTablet_bluetooth() {
		return tablet_bluetooth;
	}

	public void setTablet_bluetooth(String tablet_bluetooth) {
		this.tablet_bluetooth = tablet_bluetooth;
	}

	public String getTablet_web_camera() {
		return tablet_web_camera;
	}

	public void setTablet_web_camera(String tablet_web_camera) {
		this.tablet_web_camera = tablet_web_camera;
	}

	public String getTablet_weight() {
		return tablet_weight;
	}

	public void setTablet_weight(String tablet_weight) {
		this.tablet_weight = tablet_weight;
	}

	public int getReview_seq() {
		return review_seq;
	}

	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_grade() {
		return review_grade;
	}

	public void setReview_grade(String review_grade) {
		this.review_grade = review_grade;
	}

	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}

	public String getAvgGrade() {
		return avgGrade;
	}

	public void setAvgGrade(String avgGrade) {
		this.avgGrade = avgGrade;
	}

	public String getReviewTotalCnt() {
		return reviewTotalCnt;
	}

	public void setReviewTotalCnt(String reviewTotalCnt) {
		this.reviewTotalCnt = reviewTotalCnt;
	}

	public String getRatePoint5() {
		return ratePoint5;
	}

	public void setRatePoint5(String ratePoint5) {
		this.ratePoint5 = ratePoint5;
	}

	public String getRatePoint4() {
		return ratePoint4;
	}

	public void setRatePoint4(String ratePoint4) {
		this.ratePoint4 = ratePoint4;
	}

	public String getRatePoint3() {
		return ratePoint3;
	}

	public void setRatePoint3(String ratePoint3) {
		this.ratePoint3 = ratePoint3;
	}

	public String getRatePoint2() {
		return ratePoint2;
	}

	public void setRatePoint2(String ratePoint2) {
		this.ratePoint2 = ratePoint2;
	}

	public String getRatePoint1() {
		return ratePoint1;
	}

	public void setRatePoint1(String ratePoint1) {
		this.ratePoint1 = ratePoint1;
	}

	public int getImage_seq() {
		return image_seq;
	}

	public void setImage_seq(int image_seq) {
		this.image_seq = image_seq;
	}

	public String getImage_nme() {
		return image_nme;
	}

	public void setImage_nme(String image_nme) {
		this.image_nme = image_nme;
	}

	public String getImage_address() {
		return image_address;
	}

	public void setImage_address(String image_address) {
		this.image_address = image_address;
	}

	public String getImage_vertical() {
		return image_vertical;
	}

	public void setImage_vertical(String image_vertical) {
		this.image_vertical = image_vertical;
	}

	public String getImage_horizontal() {
		return image_horizontal;
	}

	public void setImage_horizontal(String image_horizontal) {
		this.image_horizontal = image_horizontal;
	}

	public String getImage_type() {
		return image_type;
	}

	public void setImage_type(String image_type) {
		this.image_type = image_type;
	}

	public String getCrawling_date() {
		return crawling_date;
	}

	public void setCrawling_date(String crawling_date) {
		this.crawling_date = crawling_date;
	}
	
}
