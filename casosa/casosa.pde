/**
Timeline axis of generic events
Copyright (C) 2015 Krystof Pesek

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

*/


MultiTimeline architekti;

String [] files = {
  "Francesco_Carrati-1617_1677.csv",
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
