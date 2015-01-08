%module flac

#define TAGLIB_EXPORT
#define TAGLIB_IGNORE_MISSING_DESTRUCTOR

%scheme {
  (use-modules (taglib config))
  (dynamic-call "scm_init_taglib_flac_module" (dynamic-link *taglib-path*))
}

%{
#include <taglib/taglib.h>
#include <taglib/flacfile.h>
#include <taglib/flacproperties.h>
#include <taglib/flacpicture.h>
#include <taglib/id3v1tag.h>
#include <taglib/id3v2tag.h>
#include <taglib/tpropertymap.h>
#include "helpers.h"
%}

%import(module="base") "../base/base.i"

   
%{
    SCM taglib_flac_picturelist_to_guile_list(const TagLib::List<TagLib::FLAC::Picture *> &lst) {
        SCM scm_lst = SCM_EOL;
        SCM scm_el_lst;
        for (TagLib::List<TagLib::FLAC::Picture *>::ConstIterator it = lst.begin(); it != lst.end(); it++) {
          TagLib::FLAC::Picture *picture = *it;
          scm_el_lst = scm_list_1(SWIG_NewPointerObj(picture, SWIGTYPE_p_TagLib__FLAC__Picture, 0));
          scm_lst = scm_append(scm_list_2(scm_lst, scm_el_lst));
        }
        return scm_lst;
    }
      
%}


%include <taglib/flacproperties.h>
%include <taglib/flacmetadatablock.h>
%include <taglib/flacpicture.h>
      

%rename(id3v1_tag) TagLib::FLAC::File::ID3v1Tag;
%rename(id3v2_tag) TagLib::FLAC::File::ID3v2Tag;
 %rename(flac_audio_properties) TagLib::FLAC::Properties;

%typemap(out) TagLib::List<TagLib::FLAC::Picture *> {
     $result = taglib_flac_picturelist_to_guile_list($1);
}


%apply SWIGTYPE *DISOWN { TagLib::FLAC::Picture *picture };
// Don't expose second parameter, memory should be freed by TagLib
%ignore TagLib::FLAC::File::removePicture(Picture *, bool);

%include <taglib/flacfile.h>
