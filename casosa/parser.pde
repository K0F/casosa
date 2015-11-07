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
