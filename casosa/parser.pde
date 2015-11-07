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

// TYP STAVBY,KAPLE,KOSTEL,KLÁŠTER,OBYTNÝ OBJEKT,ÚČELOVÝ OBJEKT,ZASVĚCENÍ / NÁZEV,MÍSTO,OD,DO,ROKY,ŠÍŘKA,DÉLKA,POZNÁMKA,INVESTOR,NOVOSTAVBA,PŘESTAVBA,PŘÍSTAVBA,DOSTAVBA
class Parser{

  Timeline parent;
  String filename;
  String [] data;


  Parser(Timeline _parent, String _filename){
    parent = _parent;
    filename = _filename;
    data = loadStrings(filename);

    textFont(createFont("Semplice Regular",8,false));

    parse();
  }

  void parse(){

    parent.entries = new ArrayList();

    for(int i = 1; i < data.length;i++){
      String args[] = splitTokens(data[i],",");

if(DEBUG)
println(args[0]);

      parent.entries.add(new Entry(parent,args[8],args[1],args[9],args[10]));
    }

    for(int i = 0; i < parent.entries.size();i++){
      Entry tmp = (Entry)parent.entries.get(i);
      tmp.scale();

    }
  }
}
