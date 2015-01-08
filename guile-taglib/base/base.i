%module base

%{
#include <taglib/taglib.h>
#include <taglib/tpropertymap.h>
#include <taglib/tbytevector.h>
#include <taglib/tlist.h>
#include <taglib/fileref.h>
#include <taglib/tag.h>
#include <taglib/audioproperties.h>
#include "helpers.h"

%}

#define TAGLIB_EXPORT
#define TAGLIB_IGNORE_MISSING_DESTRUCTOR


%nodefaultctor AudioProperties;

namespace TagLib {
  class StringList;
  class ByteVector;
  class IOStream;

  class String {
  public:
    enum Type { Latin1 = 0, UTF16 = 1, UTF16BE = 2, UTF8 = 3, UTF16LE = 4 };
  };

  class AudioProperties {
  public:
    enum ReadStyle { Fast, Average, Accurate };
  };

  class FileName;

  typedef wchar_t wchar;
  typedef unsigned char uchar;
  typedef unsigned int uint;
  typedef unsigned long ulong;
}

%constant int TAGLIB_MAJOR_VERSION = TAGLIB_MAJOR_VERSION;
%constant int TAGLIB_MINOR_VERSION = TAGLIB_MINOR_VERSION;
%constant int TAGLIB_PATCH_VERSION = TAGLIB_PATCH_VERSION;

// String
%typemap(out) TagLib::String {
  $result = taglib_string_to_guile_string($1);
}

// tmp is used for having a local variable that is destroyed at the end
// of the function. Doing "new TagLib::String" would be a big no-no.
%typemap(in) TagLib::String (TagLib::String tmp) {
  tmp = guile_string_to_taglib_string($input);
  $1 = &tmp;
}

%typemap(typecheck) TagLib::String = char *;
%apply TagLib::String { TagLib::String &, const TagLib::String & };

// StringList
%typemap(out) TagLib::StringList {
  $result = taglib_string_list_to_guile_string($1);
}
%typemap(in) TagLib::StringList (TagLib::StringList tmp) {
  tmp = guile_string_list_to_taglib_string_list($input);
  $1 = &tmp;
}

%apply TagLib::StringList { TagLib::StringList &, const TagLib::StringList & };

%typemap(out) TagLib::FileName {
  $result = taglib_filename_to_guile_string($1);
}
%typemap(in) TagLib::Filename {
  $1 = guile_string_to_taglib_filename($input);
}

%ignore TagLib::List::operator[];
%ignore Taglib::List::operator=;
%include <taglib/tlist.h>

%include <taglib/tag.h>

%ignore TagLib::FileName;
%include <taglib/tfile.h>

