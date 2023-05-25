class SliderModel{

  String imageAssetPath;
  String title;
  String desc;

  SliderModel({required this.imageAssetPath,required this.title,required this.desc});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

}


List<SliderModel> getSlides(){

  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = new SliderModel(imageAssetPath: '', desc: '', title: '');

  sliderModel.setDesc("Congratulations, you are now part of the great Shibe community");
  sliderModel.setTitle("Welcome");
  sliderModel.setImageAssetPath("assets/screens/1.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel(imageAssetPath: '', title: '', desc: '');

  sliderModel.setDesc("Our Dogecoin’s unofficial tagline: Do Only Good Everyday");
  sliderModel.setTitle("Here");
  sliderModel.setImageAssetPath("assets/screens/2.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel(imageAssetPath: '', title: '', desc: '');

  sliderModel.setDesc("Get lost in the Dogecoin network with all the addresses, transactions and blocks");
  sliderModel.setTitle("Explorer");
  sliderModel.setImageAssetPath("assets/screens/3.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel(desc: '', title: '', imageAssetPath: '');

  return slides;
}