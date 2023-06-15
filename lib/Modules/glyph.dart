class GlyphModule {
  int? ayahNumber;
  int? glyphId;
  int? lineNumber;
  int? maxX;
  int? maxY;
  int? minX;
  int? minY;
  int? pageNumber;
  int? position;
  int? suraNumber;

  GlyphModule(
      {this.ayahNumber,
      this.glyphId,
      this.lineNumber,
      this.maxX,
      this.maxY,
      this.minX,
      this.minY,
      this.pageNumber,
      this.position,
      this.suraNumber});

  GlyphModule.fromJson(Map<String, dynamic> json) {
    ayahNumber = json['ayah_number'];
    glyphId = json['glyph_id'];
    lineNumber = json['line_number'];
    maxX = json['max_x'];
    maxY = json['max_y'];
    minX = json['min_x'];
    minY = json['min_y'];
    pageNumber = json['page_number'];
    position = json['position'];
    suraNumber = json['sura_number'];
  }
}
