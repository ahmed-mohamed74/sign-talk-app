class Mode {
  int? modeId;
  String? modeName;
  String? a;
  String? b;
  String? c;
  String? d;
  String? e;
  String? f;
  String? g;
  String? h;
  String? i;
  String? j;
  String? k;
  String? l;
  String? m;
  String? n;

  Mode(
      {this.modeId,
        this.modeName,
        this.a,
        this.b,
        this.c,
        this.d,
        this.e,
        this.f,
        this.g,
        this.h,
        this.i,
        this.j,
        this.k,
        this.l,
        this.m,
        this.n});

  Mode.fromJson(Map<String, dynamic> json) {
    modeId = json['modeId'];
    modeName = json['modeName'];
    a = json['a'];
    b = json['b'];
    c = json['c'];
    d = json['d'];
    e = json['e'];
    f = json['f'];
    g = json['g'];
    h = json['h'];
    i = json['i'];
    j = json['j'];
    k = json['k'];
    l = json['l'];
    m = json['m'];
    n = json['n'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['modeId'] = this.modeId;
    data['modeName'] = this.modeName;
    data['a'] = this.a;
    data['b'] = this.b;
    data['c'] = this.c;
    data['d'] = this.d;
    data['e'] = this.e;
    data['f'] = this.f;
    data['g'] = this.g;
    data['h'] = this.h;
    data['i'] = this.i;
    data['j'] = this.j;
    data['k'] = this.k;
    data['l'] = this.l;
    data['m'] = this.m;
    data['n'] = this.n;
    return data;
  }
}
