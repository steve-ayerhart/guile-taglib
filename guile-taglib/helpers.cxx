#include <libguile.h>
#include <taglib/tstring.h>
#include <taglib/tstringlist.h>
#include <taglib/tfile.h>

SCM taglib_string_to_guile_string(const TagLib::String &s) {
  if (s.isNull()) {
    return SCM_BOOL_F;
  } else {
    return scm_from_locale_string(s.toCString(true));
  }
}

TagLib::String guile_string_to_taglib_string(SCM s) {
  if (scm_is_false(s)) {
    return TagLib::String::null;
  } else {
    return scm_to_locale_string(s);
  }
}

SCM taglib_string_list_to_guile_string_list(const TagLib::StringList &taglib_lst) {
  SCM scm_lst = SCM_EOL;
  SCM scm_el_lst;
  for (TagLib::StringList::ConstIterator it = taglib_lst.begin(); it != taglib_lst.end(); it++) {
    scm_el_lst = scm_list_1(taglib_string_to_guile_string(*it));
    scm_lst = scm_append(scm_list_2(scm_lst, scm_el_lst));
  }
  return scm_lst;
}

TagLib::StringList guile_string_list_to_taglib_string_list(SCM lst) {
  TagLib::StringList taglib_lst = TagLib::StringList();
  if (scm_is_null(lst)) {
    return taglib_lst;
  } else {
    for (long i = 0; i < scm_to_long(scm_length(lst)); i++) {
      SCM scm_s = scm_list_ref(lst, scm_from_long(i));
      TagLib::String s = guile_string_to_taglib_string(scm_s);
      taglib_lst.append(s);
    }
  }
}

SCM taglib_filename_to_guile_string(TagLib::FileName filename) {
  return scm_from_locale_string(filename);
}

TagLib::FileName guile_string_to_taglib_filename(SCM str) {
  return TagLib::FileName(scm_to_locale_string(str));
}
