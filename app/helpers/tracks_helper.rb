module TracksHelper
  include ERB::Util

  def ugly_lyrics(lyrics)
    new_lyrics = lyrics.split("\n").map { |line| "&#9835;" + line }
    formatted = "<pre>#{new_lyrics.join}</pre>".html_safe
    formatted
  end
end
