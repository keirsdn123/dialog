package net.su.dialog.formalModule.domain;

public class NaverShoppingVo {
	private int productSeq;// seq
	private String productUrlAdress=null;// 상세보기 링크주소
	private String productRank=null; //순위
	private String productTitle=null; //제품명
	private String productKategorie=null; //카테고리
	private String productStarPoint=null; //별점
	private String productRegisteredDate=null; //등록날짜
	private String mallInfo=null; //쇼핑몰 정보
	private String productOptionInfo=null; //추가 옵션 정보
	private String productCountStar=null; //평점 참여자 수
	private String productCountBook=null; //찜하기 수
	private String productMallCount=null;//판매처 수
	//날짜
	private int date_seq;
	private String collection_date;
	//판매처
	private int mallSeq;
	private String mallNme=null; //판매처 이름
	private String mallPrice=null;//제품 가격
	private String mallGood =null;//제품 찜하기
	private String mallDiscount=null;//제품 할인정보
	private String mallAddition=null;//제품 부가정보
	private String mallOption=null; //제품 옵션
	private String mallPriceDate=null; //제품 등록일
	private String mallDeliveryCost=null; //제품 배송료
	private String mallUrlAddress=null;
	private String productDescription=null; //제품 상세 설명
	//휴대폰 스펙
	private int phoneSeq; //휴대폰 seq
	private String phoneScreenSize=null; //화면크기
	private String phoneResolution=null; // 해상도
	private String phoneRam=null; //RAM
	private String phoneEmbedMemory=null; // 내장메모리
	private String phoneExternalMemoryType=null; //외장메모리 타입
	private String phoneOperatingSystem=null; //운영체제
	private String phoneAgency=null; //통신사
	//그래픽카드 스펙 
	private int graphiccardSeq; //그래픽카드 seq
	private String graphiccardChipset=null; //칩셋
	private String graphiccardMemoryType=null; // 메모리 종류
	private String graphiccardMemory=null; //메모리
	private String graphiccardMemoryBandwidth=null; // 메모리 대역폭
	private String graphiccardMemoryCluck=null; //메모리 클럭
	private String graphiccardProcessor=null; //프로세서
	private String graphiccardInterface=null; //인터페이스
	private String graphiccardOutputJack=null; //출력단자
	private String graphiccardGpuCluck=null;// gpu 클럭
	private String graphiccardStreamProcess=null;// 스트림 프로세스
	//저장장치 스펙
	private int storageSeq; //저장장치 seq
	private String storageHddSize=null;  //HDD 사이즈
	private String storageHddWay=null; //HDD방식
	private String storagePcConnectWay=null; //PC연결 방식
	private String storageAddFunction=null; //부가기능
	private String storageSendSpeed=null; //전송 속도
	private String storageKategorie=null;
	//태블릿 pc 스펙
	private int tabletSeq;
	private String tabletScreenSize = null;
	private String tabletResolution=null;
	private String tabletChipset_maker = null;
	private String tabletSeries = null;
	private String tabletWireless_lan = null;
	private String tabletBluetooth = null;
	private String tabletWeb_camera = null;
	private String tabletWeight = null;
	private String tabletOperatingSystem = null;
	//tv 스펙
	private int tvSeq;	//tv 고유값
	private String tvScreenSize = null; //tv 화면크기
	private String tvShape=null;	//tv 형태
	private String tvResolution = null;	//해상도
	private String tvAspectRatio = null;	//화면비율
	private String tvType = null;	//종류
	private String tvTerminal = null;	//단자
	private String tvTechnique = null;	//부가기능
	private String tvEnergyEfficiency = null;	//에너지 효율
	private String tvPowerConsumption = null;	//소비 전력
	private String tvBrightness = null;	//밝기
	private String tvBackLight = null; //백라이트
	//크롤링 수집 날짜
	private String crawlingDate =null;
	
	
	public String getTabletOperatingSystem() {
		return tabletOperatingSystem;
	}
	public void setTabletOperatingSystem(String tabletOperatingSystem) {
		this.tabletOperatingSystem = tabletOperatingSystem;
	}
	public int getProductSeq() {
		return productSeq;
	}
	public void setProductSeq(int productSeq) {
		this.productSeq = productSeq;
	}
	public String getProductUrlAdress() {
		return productUrlAdress;
	}
	public void setProductUrlAdress(String productUrlAdress) {
		this.productUrlAdress = productUrlAdress;
	}
	public String getProductRank() {
		return productRank;
	}
	public void setProductRank(String productRank) {
		this.productRank = productRank;
	}
	public String getProductTitle() {
		return productTitle;
	}
	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}
	public String getProductKategorie() {
		return productKategorie;
	}
	public void setProductKategorie(String productKategorie) {
		this.productKategorie = productKategorie;
	}
	public String getProductStarPoint() {
		return productStarPoint;
	}
	public void setProductStarPoint(String productStarPoint) {
		this.productStarPoint = productStarPoint;
	}
	public String getProductRegisteredDate() {
		return productRegisteredDate;
	}
	public void setProductRegisteredDate(String productRegisteredDate) {
		this.productRegisteredDate = productRegisteredDate;
	}
	public String getMallInfo() {
		return mallInfo;
	}
	public void setMallInfo(String mallInfo) {
		this.mallInfo = mallInfo;
	}
	public String getProductOptionInfo() {
		return productOptionInfo;
	}
	public void setProductOptionInfo(String productOptionInfo) {
		this.productOptionInfo = productOptionInfo;
	}
	public String getProductCountStar() {
		return productCountStar;
	}
	public void setProductCountStar(String productCountStar) {
		this.productCountStar = productCountStar;
	}
	public String getProductCountBook() {
		return productCountBook;
	}
	public void setProductCountBook(String productCountBook) {
		this.productCountBook = productCountBook;
	}
	public String getProductMallCount() {
		return productMallCount;
	}
	public void setProductMallCount(String productMallCount) {
		this.productMallCount = productMallCount;
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
	public int getMallSeq() {
		return mallSeq;
	}
	public void setMallSeq(int mallSeq) {
		this.mallSeq = mallSeq;
	}
	public String getMallNme() {
		return mallNme;
	}
	public void setMallNme(String mallNme) {
		this.mallNme = mallNme;
	}
	public String getMallPrice() {
		return mallPrice;
	}
	public void setMallPrice(String mallPrice) {
		this.mallPrice = mallPrice;
	}
	public String getMallGood() {
		return mallGood;
	}
	public void setMallGood(String mallGood) {
		this.mallGood = mallGood;
	}
	public String getMallDiscount() {
		return mallDiscount;
	}
	public void setMallDiscount(String mallDiscount) {
		this.mallDiscount = mallDiscount;
	}
	public String getMallAddition() {
		return mallAddition;
	}
	public void setMallAddition(String mallAddition) {
		this.mallAddition = mallAddition;
	}
	public String getMallOption() {
		return mallOption;
	}
	public void setMallOption(String mallOption) {
		this.mallOption = mallOption;
	}
	public String getMallPriceDate() {
		return mallPriceDate;
	}
	public void setMallPriceDate(String mallPriceDate) {
		this.mallPriceDate = mallPriceDate;
	}
	public String getMallDeliveryCost() {
		return mallDeliveryCost;
	}
	public void setMallDeliveryCost(String mallDeliveryCost) {
		this.mallDeliveryCost = mallDeliveryCost;
	}
	public String getMallUrlAddress() {
		return mallUrlAddress;
	}
	public void setMallUrlAddress(String mallUrlAddress) {
		this.mallUrlAddress = mallUrlAddress;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public int getPhoneSeq() {
		return phoneSeq;
	}
	public void setPhoneSeq(int phoneSeq) {
		this.phoneSeq = phoneSeq;
	}
	public String getPhoneScreenSize() {
		return phoneScreenSize;
	}
	public void setPhoneScreenSize(String phoneScreenSize) {
		this.phoneScreenSize = phoneScreenSize;
	}
	public String getPhoneResolution() {
		return phoneResolution;
	}
	public void setPhoneResolution(String phoneResolution) {
		this.phoneResolution = phoneResolution;
	}
	public String getPhoneRam() {
		return phoneRam;
	}
	public void setPhoneRam(String phoneRam) {
		this.phoneRam = phoneRam;
	}
	public String getPhoneEmbedMemory() {
		return phoneEmbedMemory;
	}
	public void setPhoneEmbedMemory(String phoneEmbedMemory) {
		this.phoneEmbedMemory = phoneEmbedMemory;
	}
	public String getPhoneExternalMemoryType() {
		return phoneExternalMemoryType;
	}
	public void setPhoneExternalMemoryType(String phoneExternalMemoryType) {
		this.phoneExternalMemoryType = phoneExternalMemoryType;
	}
	public String getPhoneOperatingSystem() {
		return phoneOperatingSystem;
	}
	public void setPhoneOperatingSystem(String phoneOperatingSystem) {
		this.phoneOperatingSystem = phoneOperatingSystem;
	}
	public String getPhoneAgency() {
		return phoneAgency;
	}
	public void setPhoneAgency(String phoneAgency) {
		this.phoneAgency = phoneAgency;
	}
	public int getGraphiccardSeq() {
		return graphiccardSeq;
	}
	public void setGraphiccardSeq(int graphiccardSeq) {
		this.graphiccardSeq = graphiccardSeq;
	}
	public String getGraphiccardChipset() {
		return graphiccardChipset;
	}
	public void setGraphiccardChipset(String graphiccardChipset) {
		this.graphiccardChipset = graphiccardChipset;
	}
	public String getGraphiccardMemoryType() {
		return graphiccardMemoryType;
	}
	public void setGraphiccardMemoryType(String graphiccardMemoryType) {
		this.graphiccardMemoryType = graphiccardMemoryType;
	}
	public String getGraphiccardMemory() {
		return graphiccardMemory;
	}
	public void setGraphiccardMemory(String graphiccardMemory) {
		this.graphiccardMemory = graphiccardMemory;
	}
	public String getGraphiccardMemoryBandwidth() {
		return graphiccardMemoryBandwidth;
	}
	public void setGraphiccardMemoryBandwidth(String graphiccardMemoryBandwidth) {
		this.graphiccardMemoryBandwidth = graphiccardMemoryBandwidth;
	}
	public String getGraphiccardMemoryCluck() {
		return graphiccardMemoryCluck;
	}
	public void setGraphiccardMemoryCluck(String graphiccardMemoryCluck) {
		this.graphiccardMemoryCluck = graphiccardMemoryCluck;
	}
	public String getGraphiccardProcessor() {
		return graphiccardProcessor;
	}
	public void setGraphiccardProcessor(String graphiccardProcessor) {
		this.graphiccardProcessor = graphiccardProcessor;
	}
	public String getGraphiccardInterface() {
		return graphiccardInterface;
	}
	public void setGraphiccardInterface(String graphiccardInterface) {
		this.graphiccardInterface = graphiccardInterface;
	}
	public String getGraphiccardOutputJack() {
		return graphiccardOutputJack;
	}
	public void setGraphiccardOutputJack(String graphiccardOutputJack) {
		this.graphiccardOutputJack = graphiccardOutputJack;
	}
	public String getGraphiccardGpuCluck() {
		return graphiccardGpuCluck;
	}
	public void setGraphiccardGpuCluck(String graphiccardGpuCluck) {
		this.graphiccardGpuCluck = graphiccardGpuCluck;
	}
	public String getGraphiccardStreamProcess() {
		return graphiccardStreamProcess;
	}
	public void setGraphiccardStreamProcess(String graphiccardStreamProcess) {
		this.graphiccardStreamProcess = graphiccardStreamProcess;
	}
	public int getStorageSeq() {
		return storageSeq;
	}
	public void setStorageSeq(int storageSeq) {
		this.storageSeq = storageSeq;
	}
	public String getStorageHddSize() {
		return storageHddSize;
	}
	public void setStorageHddSize(String storageHddSize) {
		this.storageHddSize = storageHddSize;
	}
	public String getStorageHddWay() {
		return storageHddWay;
	}
	public void setStorageHddWay(String storageHddWay) {
		this.storageHddWay = storageHddWay;
	}
	public String getStoragePcConnectWay() {
		return storagePcConnectWay;
	}
	public void setStoragePcConnectWay(String storagePcConnectWay) {
		this.storagePcConnectWay = storagePcConnectWay;
	}
	public String getStorageAddFunction() {
		return storageAddFunction;
	}
	public void setStorageAddFunction(String storageAddFunction) {
		this.storageAddFunction = storageAddFunction;
	}
	public String getStorageSendSpeed() {
		return storageSendSpeed;
	}
	public void setStorageSendSpeed(String storageSendSpeed) {
		this.storageSendSpeed = storageSendSpeed;
	}
	public String getStorageKategorie() {
		return storageKategorie;
	}
	public void setStorageKategorie(String storageKategorie) {
		this.storageKategorie = storageKategorie;
	}
	public int getTabletSeq() {
		return tabletSeq;
	}
	public void setTabletSeq(int tabletSeq) {
		this.tabletSeq = tabletSeq;
	}
	public String getTabletScreenSize() {
		return tabletScreenSize;
	}
	public void setTabletScreenSize(String tabletScreenSize) {
		this.tabletScreenSize = tabletScreenSize;
	}
	public String getTabletResolution() {
		return tabletResolution;
	}
	public void setTabletResolution(String tabletResolution) {
		this.tabletResolution = tabletResolution;
	}
	public String getTabletChipset_maker() {
		return tabletChipset_maker;
	}
	public void setTabletChipset_maker(String tabletChipset_maker) {
		this.tabletChipset_maker = tabletChipset_maker;
	}
	public String getTabletSeries() {
		return tabletSeries;
	}
	public void setTabletSeries(String tabletSeries) {
		this.tabletSeries = tabletSeries;
	}
	public String getTabletWireless_lan() {
		return tabletWireless_lan;
	}
	public void setTabletWireless_lan(String tabletWireless_lan) {
		this.tabletWireless_lan = tabletWireless_lan;
	}
	public String getTabletBluetooth() {
		return tabletBluetooth;
	}
	public void setTabletBluetooth(String tabletBluetooth) {
		this.tabletBluetooth = tabletBluetooth;
	}
	public String getTabletWeb_camera() {
		return tabletWeb_camera;
	}
	public void setTabletWeb_camera(String tabletWeb_camera) {
		this.tabletWeb_camera = tabletWeb_camera;
	}
	public String getTabletWeight() {
		return tabletWeight;
	}
	public void setTabletWeight(String tabletWeight) {
		this.tabletWeight = tabletWeight;
	}
	public int getTvSeq() {
		return tvSeq;
	}
	public void setTvSeq(int tvSeq) {
		this.tvSeq = tvSeq;
	}
	public String getTvScreenSize() {
		return tvScreenSize;
	}
	public void setTvScreenSize(String tvScreenSize) {
		this.tvScreenSize = tvScreenSize;
	}
	public String getTvShape() {
		return tvShape;
	}
	public void setTvShape(String tvShape) {
		this.tvShape = tvShape;
	}
	public String getTvResolution() {
		return tvResolution;
	}
	public void setTvResolution(String tvResolution) {
		this.tvResolution = tvResolution;
	}
	public String getTvAspectRatio() {
		return tvAspectRatio;
	}
	public void setTvAspectRatio(String tvAspectRatio) {
		this.tvAspectRatio = tvAspectRatio;
	}
	public String getTvType() {
		return tvType;
	}
	public void setTvType(String tvType) {
		this.tvType = tvType;
	}
	public String getTvTerminal() {
		return tvTerminal;
	}
	public void setTvTerminal(String tvTerminal) {
		this.tvTerminal = tvTerminal;
	}
	public String getTvTechnique() {
		return tvTechnique;
	}
	public void setTvTechnique(String tvTechnique) {
		this.tvTechnique = tvTechnique;
	}
	public String getTvEnergyEfficiency() {
		return tvEnergyEfficiency;
	}
	public void setTvEnergyEfficiency(String tvEnergyEfficiency) {
		this.tvEnergyEfficiency = tvEnergyEfficiency;
	}
	public String getTvPowerConsumption() {
		return tvPowerConsumption;
	}
	public void setTvPowerConsumption(String tvPowerConsumption) {
		this.tvPowerConsumption = tvPowerConsumption;
	}
	public String getTvBrightness() {
		return tvBrightness;
	}
	public void setTvBrightness(String tvBrightness) {
		this.tvBrightness = tvBrightness;
	}
	public String getTvBackLight() {
		return tvBackLight;
	}
	public void setTvBackLight(String tvBackLight) {
		this.tvBackLight = tvBackLight;
	}
	public String getCrawlingDate() {
		return crawlingDate;
	}
	public void setCrawlingDate(String crawlingDate) {
		this.crawlingDate = crawlingDate;
	}
	
	
}
