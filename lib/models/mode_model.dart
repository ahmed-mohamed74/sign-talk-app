class Mode {
  final int modeId;
  String? modeName;
  final String? a;
  final String? b;
  final String? c;
  final String? d;
  final String? e;
  final String? f;
  final String? g;
  final String? h;
  final String? i;
  final String? j;
  final String? k;
  final String? l;
  final String? m;
  final String? n;

  Mode({
    required this.modeId,
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
    this.n,
  });

  factory Mode.fromJson(Map<String, dynamic>? json) => Mode(
    modeId: json!['modeId'] as int,
    modeName: json['modeName'] as String,
    a: json['a'] as String?,
    b: json['b'] as String?,
    c: json['c'] as String?,
    d: json['d'] as String?,
    e: json['e'] as String?,
    f: json['f'] as String?,
    g: json['g'] as String?,
    h: json['h'] as String?,
    i: json['i'] as String?,
    j: json['j'] as String?,
    k: json['k'] as String?,
    l: json['l'] as String?,
    m: json['m'] as String?,
    n: json['n'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'modeId': modeId,
    'modeName': modeName,
    'a': a,
    'b': b,
    'c': c,
    'd': d,
    'e': e,
    'f': f,
    'g': g,
    'h': h,
    'i': i,
    'j': j,
    'k': k,
    'l': l,
    'm': m,
    'n': n,
  };
}
