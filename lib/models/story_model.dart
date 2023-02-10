enum MediaType {
  image,
  video,
}

class Story {
  final String? image;
  final MediaType? media;
  final Duration? duration;

  const Story({
    this.image,
    this.media,
    this.duration,
  });
}
