


MultiTimeline architekti;
String [] files = {"Francesco_Carrati-1617_1677.csv",
  "Jan_Blazej_Santini-1677_1723.csv",
  "Kilian_Ignac_Dientzehoffer-1689_1751.csv",
  "Krystof_Dientzehoffer-1655_1722.csv"
};


boolean DEBUG = true;

void setup(){
  size(1600,900,P2D);

  colorMode(HSB);

  architekti = new MultiTimeline(files);
}



void draw(){
  background(255);
  architekti.draw();
  architekti.drawEntries();
}



void mouseReleased(){

  for(int i =0 ; i < architekti.timelines.size();i++){
    Timeline tmp = (Timeline)architekti.timelines.get(i);
    if(tmp.over)
      tmp.plot=!tmp.plot;
  }

}
