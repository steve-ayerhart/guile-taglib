#ifndef __GUILE_TAGLIB_HELPERS__
#define __GUILE_TAGLIB_HELPERS__

SCM taglib_string_to_guile_string(const TagLib::String &s);
TagLib::String guile_string_to_taglib_string(SCM s);
SCM taglib_string_list_to_guile_string_list(const TagLib::StringList &taglib_lst);
TagLib::StringList guile_string_list_to_taglib_string_list(SCM lst);
SCM taglib_filename_to_guile_string(TagLib::FileName filename);
TagLib::FileName guile_string_to_taglib_filename(SCM str);

#endif
