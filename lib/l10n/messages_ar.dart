// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.
// @dart=2.12
// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = MessageLookup();

typedef String? MessageIfAbsent(
    String? messageStr, List<Object>? args);

class MessageLookup extends MessageLookupByLibrary {
  @override
  String get localeName => 'ar';

  static m0(days) => "${Intl.plural(days, one: 'منذ يوم واحد', other: 'منذ ${days} يوم')}";

  static m1(hours) => "${Intl.plural(hours, one: 'منذ ${hours} ساعة', other: 'منذ ${hours} ساعة')}";

  static m2(minutes) => "${minutes} دقيقة متبقية";

  static m3(minutes) => "${Intl.plural(minutes, one: 'منذ دقيقة واحدة', other: 'منذ ${minutes} دقيقة')}";

  static m4(seconds) => "${seconds} ثانية متبقية";

  static m5(weeks) => "${Intl.plural(weeks, one: 'منذ أسبوع واحد', other: 'منذ ${weeks} أسبوع')}";

  static m6(days) => "${Intl.plural(days, one: 'منذ يوم', other: 'منذ ${days} يوم')}";

  static m7(hours) => "${Intl.plural(hours, one: 'منذ ساعة', other: 'منذ ${hours} ساعة')}";

  static m8(minutes) => "${minutes} د متبقية";

  static m9(minutes) => "${Intl.plural(minutes, one: 'منذ دقيقة', other: 'منذ ${minutes} د')}";

  static m10(seconds) => "${seconds} ث متبقية";

  static m11(weeks) => "${Intl.plural(weeks, one: 'منذ أسبوع', other: 'منذ ${weeks} أسبوع')}";

  static m12(minutes) => "${minutes} دقيقة";

  static m13(minutes) => "${minutes} د";

  static m14(seconds) => "${seconds} ث";

  static m15(minutes) => "${minutes} دقيقة";

  static m16(seconds) => "${seconds} ثانية";

  @override
  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, dynamic> _notInlinedMessages(Object? _) => {
      'about_label': MessageLookupByLibrary.simpleMessage('حول'),
    'add_rss_feed_option': MessageLookupByLibrary.simpleMessage('إضافة موجز RSS'),
    'app_title': MessageLookupByLibrary.simpleMessage('PodMate مشغل البودكاست'),
    'app_title_short': MessageLookupByLibrary.simpleMessage('PodMate'),
    'audio_effect_trim_silence_label': MessageLookupByLibrary.simpleMessage('قص الصمت'),
    'audio_effect_volume_boost_label': MessageLookupByLibrary.simpleMessage('تعزيز الصوت'),
    'audio_settings_playback_speed_label': MessageLookupByLibrary.simpleMessage('سرعة التشغيل'),
    'auto_scroll_transcript_label': MessageLookupByLibrary.simpleMessage('متابعة النص المكتوب'),
    'cancel_button_label': MessageLookupByLibrary.simpleMessage('إلغاء'),
    'cancel_download_button_label': MessageLookupByLibrary.simpleMessage('إلغاء التحميل'),
    'cancel_option_label': MessageLookupByLibrary.simpleMessage('إلغاء'),
    'chapters_label': MessageLookupByLibrary.simpleMessage('الفصول'),
    'clear_queue_button_label': MessageLookupByLibrary.simpleMessage('مسح قائمة الانتظار'),
    'clear_search_button_label': MessageLookupByLibrary.simpleMessage('مسح نص البحث'),
    'close_button_label': MessageLookupByLibrary.simpleMessage('إغلاق'),
    'consent_message': MessageLookupByLibrary.simpleMessage('سينقلك رابط التمويل هذا إلى موقع خارجي حيث يمكنك دعم البرنامج مباشرة. الروابط مقدمة من مؤلفي البودكاست وليست مراقبة من قبل Anytime.'),
    'continue_button_label': MessageLookupByLibrary.simpleMessage('متابعة'),
    'delete_button_label': MessageLookupByLibrary.simpleMessage('حذف'),
    'delete_episode_button_label': MessageLookupByLibrary.simpleMessage('حذف الحلقة المحملة'),
    'delete_episode_confirmation': MessageLookupByLibrary.simpleMessage('هل أنت متأكد أنك تريد حذف هذه الحلقة؟'),
    'delete_episode_title': MessageLookupByLibrary.simpleMessage('حذف الحلقة'),
    'delete_label': MessageLookupByLibrary.simpleMessage('حذف'),
    'discover': MessageLookupByLibrary.simpleMessage('استكشف'),
    'discovery_categories_itunes': MessageLookupByLibrary.simpleMessage('الكل,الفنون,الأعمال,الكوميديا,التعليم,الخيال,الحكومة,الصحة واللياقة,التاريخ,الأطفال والعائلة,الترفيه,الموسيقى,الأخبار,الدين والروحانية,العلوم,المجتمع والثقافة,الرياضة,التلفزيون والأفلام,التكنولوجيا,الجريمة الحقيقية'),
    'discovery_categories_pindex': MessageLookupByLibrary.simpleMessage('الكل,برامج ما بعد العرض,بديل,حيوانات,رسوم متحركة,فنون,علم الفلك,سيارات,طيران,بيسبول,كرة السلة,جمال,كتب,بوذية,أعمال,وظائف,كيمياء,مسيحية,مناخ,كوميديا,تعليق,دورات,حرف يدوية,كريكيت,عملات رقمية,ثقافة,يومي,تصميم,وثائقي,دراما,أرض,تعليم,ترفيه,ريادة أعمال,عائلة,خيال,موضة,خيال أدبي,سينما,لياقة بدنية,طعام,كرة قدم أمريكية,ألعاب,حديقة,جولف,حكومة,صحة,هندوسية,تاريخ,هوايات,هوكي,منزل,إرشادات,ارتجال,مقابلات,استثمار,إسلام,مجلات,يهودية,أطفال,لغة,تعلم,ترفيه,حياة,إدارة,مانجا,تسويق,رياضيات,طب,صحة نفسية,موسيقى,طبيعي,طبيعة,أخبار,غير ربحي,تغذية,تربية,فنون أداء,شخصي,حيوانات أليفة,فلسفة,فيزياء,أماكن,سياسة,علاقات,دين,مراجعات,لعب أدوار,رجبي,جري,علوم,تطوير الذات,جنسانية,كرة قدم,اجتماعي,مجتمع,روحانيات,رياضة,كوميديا ارتجالية,قصص,سباحة,تلفزيون,ألعاب طاولة,تقنية,تنس,سفر,جرائم حقيقية,ألعاب فيديو,بصري,كرة طائرة,طقس,برية,مصارعة'),
    'download_episode_button_label': MessageLookupByLibrary.simpleMessage('تحميل الحلقة'),
    'downloads': MessageLookupByLibrary.simpleMessage('التنزيلات'),
    'empty_queue_message': MessageLookupByLibrary.simpleMessage('قائمة الانتظار فارغة'),
    'episode_details_button_label': MessageLookupByLibrary.simpleMessage('عرض معلومات الحلقة'),
    'episode_filter_clear_filters_button_label': MessageLookupByLibrary.simpleMessage('مسح الفلاتر'),
    'episode_filter_no_episodes_title_description': MessageLookupByLibrary.simpleMessage('هذا البودكاست ليس لديه حلقات تطابق معايير البحث والفلتر الخاصة بك'),
    'episode_filter_no_episodes_title_label': MessageLookupByLibrary.simpleMessage('لم يتم العثور على حلقات'),
    'episode_filter_none_label': MessageLookupByLibrary.simpleMessage('بدون'),
    'episode_filter_played_label': MessageLookupByLibrary.simpleMessage('مُشاهدة'),
    'episode_filter_semantic_label': MessageLookupByLibrary.simpleMessage('تصفية الحلقات'),
    'episode_filter_started_label': MessageLookupByLibrary.simpleMessage('بدأت'),
    'episode_filter_unplayed_label': MessageLookupByLibrary.simpleMessage('غير مُشاهدة'),
    'episode_label': MessageLookupByLibrary.simpleMessage('الحلقة'),
    'episode_semantic_time_days_ago': m0,
    'episode_semantic_time_hours_ago': m1,
    'episode_semantic_time_minute_remaining': m2,
    'episode_semantic_time_minutes_ago': m3,
    'episode_semantic_time_second_remaining': m4,
    'episode_semantic_time_weeks_ago': m5,
    'episode_sort_alphabetical_ascending_label': MessageLookupByLibrary.simpleMessage('أبجدي أ-ي'),
    'episode_sort_alphabetical_descending_label': MessageLookupByLibrary.simpleMessage('أبجدي ي-أ'),
    'episode_sort_earliest_first_label': MessageLookupByLibrary.simpleMessage('الأقدم أولاً'),
    'episode_sort_latest_first_label': MessageLookupByLibrary.simpleMessage('الأحدث أولاً'),
    'episode_sort_none_label': MessageLookupByLibrary.simpleMessage('افتراضي'),
    'episode_sort_semantic_label': MessageLookupByLibrary.simpleMessage('ترتيب الحلقات'),
    'episode_time_days_ago': m6,
    'episode_time_hours_ago': m7,
    'episode_time_minute_remaining': m8,
    'episode_time_minutes_ago': m9,
    'episode_time_now': MessageLookupByLibrary.simpleMessage('الآن'),
    'episode_time_second_remaining': m10,
    'episode_time_weeks_ago': m11,
    'error_no_connection': MessageLookupByLibrary.simpleMessage('تعذر تشغيل الحلقة. يرجى التحقق من اتصالك والمحاولة مرة أخرى.'),
    'error_playback_fail': MessageLookupByLibrary.simpleMessage('حدث خطأ غير متوقع أثناء التشغيل. يرجى التحقق من اتصالك والمحاولة مرة أخرى.'),
    'fast_forward_button_label': MessageLookupByLibrary.simpleMessage('تقديم الحلقة 30 ثانية'),
    'feedback_menu_item_label': MessageLookupByLibrary.simpleMessage('ملاحظات'),
    'go_back_button_label': MessageLookupByLibrary.simpleMessage('رجوع'),
    'label_episode_actions': MessageLookupByLibrary.simpleMessage('إجراءات الحلقة'),
    'label_megabytes': MessageLookupByLibrary.simpleMessage('ميجابايت'),
    'label_megabytes_abbr': MessageLookupByLibrary.simpleMessage('م.ب'),
    'label_opml_importing': MessageLookupByLibrary.simpleMessage('جارٍ الاستيراد'),
    'layout_label': MessageLookupByLibrary.simpleMessage('التخطيط'),
    'library': MessageLookupByLibrary.simpleMessage('المكتبة'),
    'mark_episodes_not_played_label': MessageLookupByLibrary.simpleMessage('وضع علامة على جميع الحلقات كغير مشغلة'),
    'mark_episodes_played_label': MessageLookupByLibrary.simpleMessage('وضع علامة على جميع الحلقات كمشغلة'),
    'mark_played_label': MessageLookupByLibrary.simpleMessage('وضع علامة كمشغل'),
    'mark_unplayed_label': MessageLookupByLibrary.simpleMessage('وضع علامة كغير مشغل'),
    'minimise_player_window_button_label': MessageLookupByLibrary.simpleMessage('تصغير نافذة المشغل'),
    'more_label': MessageLookupByLibrary.simpleMessage('المزيد'),
    'new_episodes_label': MessageLookupByLibrary.simpleMessage('حلقات جديدة متاحة'),
    'new_episodes_view_now_label': MessageLookupByLibrary.simpleMessage('عرض الآن'),
    'no_downloads_message': MessageLookupByLibrary.simpleMessage('ليس لديك أي حلقات محملة'),
    'no_podcast_details_message': MessageLookupByLibrary.simpleMessage('تعذر تحميل حلقات البودكاست. يرجى التحقق من اتصالك.'),
    'no_search_results_message': MessageLookupByLibrary.simpleMessage('لم يتم العثور على بودكاست'),
    'no_subscriptions_message': MessageLookupByLibrary.simpleMessage('اضغط على زر الاستكشاف أدناه أو استخدم شريط البحث أعلاه للعثور على أول بودكاست لك'),
    'no_transcript_available_label': MessageLookupByLibrary.simpleMessage('النص المكتوب غير متوفر لهذا البودكاست'),
    'notes_label': MessageLookupByLibrary.simpleMessage('الملاحظات'),
    'now_playing_episode_position': MessageLookupByLibrary.simpleMessage('موضع الحلقة'),
    'now_playing_episode_time_remaining': MessageLookupByLibrary.simpleMessage('الوقت المتبقي'),
    'now_playing_queue_label': MessageLookupByLibrary.simpleMessage('قيد التشغيل الآن'),
    'ok_button_label': MessageLookupByLibrary.simpleMessage('موافق'),
    'open_show_website_label': MessageLookupByLibrary.simpleMessage('فتح موقع العرض'),
    'opml_export_button_label': MessageLookupByLibrary.simpleMessage('تصدير'),
    'opml_import_button_label': MessageLookupByLibrary.simpleMessage('استيراد'),
    'opml_import_export_label': MessageLookupByLibrary.simpleMessage('استيراد/تصدير OPML'),
    'pause_button_label': MessageLookupByLibrary.simpleMessage('إيقاف الحلقة مؤقتاً'),
    'play_button_label': MessageLookupByLibrary.simpleMessage('تشغيل الحلقة'),
    'play_download_button_label': MessageLookupByLibrary.simpleMessage('تشغيل الحلقة المحملة'),
    'playback_speed_label': MessageLookupByLibrary.simpleMessage('سرعة التشغيل'),
    'podcast_funding_dialog_header': MessageLookupByLibrary.simpleMessage('تمويل البودكاست'),
    'podcast_options_overflow_menu_semantic_label': MessageLookupByLibrary.simpleMessage('قائمة الخيارات'),
    'queue_add_label': MessageLookupByLibrary.simpleMessage('إضافة'),
    'queue_clear_button_label': MessageLookupByLibrary.simpleMessage('مسح'),
    'queue_clear_label': MessageLookupByLibrary.simpleMessage('هل أنت متأكد أنك تريد مسح قائمة الانتظار؟'),
    'queue_clear_label_title': MessageLookupByLibrary.simpleMessage('مسح قائمة الانتظار'),
    'queue_remove_label': MessageLookupByLibrary.simpleMessage('إزالة'),
    'refresh_feed_label': MessageLookupByLibrary.simpleMessage('تحديث الحلقات'),
    'resume_button_label': MessageLookupByLibrary.simpleMessage('استئناف الحلقة'),
    'rewind_button_label': MessageLookupByLibrary.simpleMessage('إرجاع الحلقة 10 ثوانٍ'),
    'scrim_episode_details_selector': MessageLookupByLibrary.simpleMessage('إغلاق تفاصيل الحلقة'),
    'scrim_episode_filter_selector': MessageLookupByLibrary.simpleMessage('إغلاق تصفية الحلقة'),
    'scrim_episode_sort_selector': MessageLookupByLibrary.simpleMessage('إغلاق ترتيب الحلقة'),
    'scrim_layout_selector': MessageLookupByLibrary.simpleMessage('إغلاق محدد التخطيط'),
    'scrim_sleep_timer_selector': MessageLookupByLibrary.simpleMessage('إغلاق محدد مؤقت السكون'),
    'scrim_speed_selector': MessageLookupByLibrary.simpleMessage('إغلاق محدد سرعة التشغيل'),
    'search_back_button_label': MessageLookupByLibrary.simpleMessage('رجوع'),
    'search_button_label': MessageLookupByLibrary.simpleMessage('بحث'),
    'search_episodes_label': MessageLookupByLibrary.simpleMessage('البحث في الحلقات'),
    'search_for_podcasts_hint': MessageLookupByLibrary.simpleMessage('ابحث عن بودكاست'),
    'search_provider_label': MessageLookupByLibrary.simpleMessage('مزود البحث'),
    'search_transcript_label': MessageLookupByLibrary.simpleMessage('البحث في النص المكتوب'),
    'semantic_announce_loading': MessageLookupByLibrary.simpleMessage('جارٍ التحميل، يرجى الانتظار.'),
    'semantic_announce_searching': MessageLookupByLibrary.simpleMessage('جارٍ البحث، يرجى الانتظار.'),
    'semantic_chapter_link_label': MessageLookupByLibrary.simpleMessage('رابط ويب الفصل'),
    'semantic_current_chapter_label': MessageLookupByLibrary.simpleMessage('الفصل الحالي'),
    'semantic_current_value_label': MessageLookupByLibrary.simpleMessage('القيمة الحالية'),
    'semantic_playing_options_collapse_label': MessageLookupByLibrary.simpleMessage('إغلاق منزلق خيارات التشغيل'),
    'semantic_playing_options_expand_label': MessageLookupByLibrary.simpleMessage('فتح منزلق خيارات التشغيل'),
    'semantic_podcast_artwork_label': MessageLookupByLibrary.simpleMessage('صورة البودكاست'),
    'semantics_add_to_queue': MessageLookupByLibrary.simpleMessage('إضافة الحلقة إلى قائمة الانتظار'),
    'semantics_collapse_podcast_description': MessageLookupByLibrary.simpleMessage('طي وصف البودكاست'),
    'semantics_decrease_playback_speed': MessageLookupByLibrary.simpleMessage('تقليل سرعة التشغيل'),
    'semantics_episode_tile_collapsed': MessageLookupByLibrary.simpleMessage('عنصر قائمة الحلقة. يعرض الصورة والملخص والتحكم الرئيسي.'),
    'semantics_episode_tile_collapsed_hint': MessageLookupByLibrary.simpleMessage('التوسيع وإظهار المزيد من التفاصيل والخيارات الإضافية'),
    'semantics_episode_tile_expanded': MessageLookupByLibrary.simpleMessage('عنصر قائمة الحلقة. يعرض الوصف والتحكم الرئيسي والتحكم الإضافي.'),
    'semantics_episode_tile_expanded_hint': MessageLookupByLibrary.simpleMessage('الطي وإظهار الملخص والتنزيل وعنصر التحكم في التشغيل'),
    'semantics_expand_podcast_description': MessageLookupByLibrary.simpleMessage('توسيع وصف البودكاست'),
    'semantics_increase_playback_speed': MessageLookupByLibrary.simpleMessage('زيادة سرعة التشغيل'),
    'semantics_layout_option_compact_grid': MessageLookupByLibrary.simpleMessage('تخطيط الشبكة المضغوط'),
    'semantics_layout_option_grid': MessageLookupByLibrary.simpleMessage('تخطيط الشبكة'),
    'semantics_layout_option_list': MessageLookupByLibrary.simpleMessage('تخطيط القائمة'),
    'semantics_main_player_header': MessageLookupByLibrary.simpleMessage('نافذة المشغل الرئيسية'),
    'semantics_mark_episode_played': MessageLookupByLibrary.simpleMessage('وضع علامة مُشاهد على الحلقة'),
    'semantics_mark_episode_unplayed': MessageLookupByLibrary.simpleMessage('وضع علامة غير مُشاهد على الحلقة'),
    'semantics_mini_player_header': MessageLookupByLibrary.simpleMessage('المشغل المصغر. اسحب لليمين لزر التشغيل/الإيقاف. انقر للفتح نافذة المشغل الرئيسية'),
    'semantics_play_pause_toggle': MessageLookupByLibrary.simpleMessage('زر التشغيل/الإيقاف'),
    'semantics_podcast_details_header': MessageLookupByLibrary.simpleMessage('صفحة تفاصيل البودكاست والحلقات'),
    'semantics_remove_from_queue': MessageLookupByLibrary.simpleMessage('إزالة الحلقة من قائمة الانتظار'),
    'settings_auto_open_now_playing': MessageLookupByLibrary.simpleMessage('وضع المشغل بملء الشاشة عند بدء الحلقة'),
    'settings_auto_update_episodes': MessageLookupByLibrary.simpleMessage('تحديث الحلقات تلقائياً'),
    'settings_auto_update_episodes_10min': MessageLookupByLibrary.simpleMessage('10 دقائق منذ آخر تحديث'),
    'settings_auto_update_episodes_12hour': MessageLookupByLibrary.simpleMessage('12 ساعة منذ آخر تحديث'),
    'settings_auto_update_episodes_1hour': MessageLookupByLibrary.simpleMessage('ساعة واحدة منذ آخر تحديث'),
    'settings_auto_update_episodes_30min': MessageLookupByLibrary.simpleMessage('30 دقيقة منذ آخر تحديث'),
    'settings_auto_update_episodes_3hour': MessageLookupByLibrary.simpleMessage('3 ساعات منذ آخر تحديث'),
    'settings_auto_update_episodes_6hour': MessageLookupByLibrary.simpleMessage('6 ساعات منذ آخر تحديث'),
    'settings_auto_update_episodes_always': MessageLookupByLibrary.simpleMessage('دائماً'),
    'settings_auto_update_episodes_heading': MessageLookupByLibrary.simpleMessage('تحديث الحلقات في شاشة التفاصيل بعد'),
    'settings_auto_update_episodes_never': MessageLookupByLibrary.simpleMessage('أبداً'),
    'settings_continuous_play_option': MessageLookupByLibrary.simpleMessage('التشغيل المستمر'),
    'settings_continuous_play_subtitle': MessageLookupByLibrary.simpleMessage('تشغيل الحلقة التالية في البودكاست تلقائياً إذا كانت قائمة الانتظار فارغة'),
    'settings_data_divider_label': MessageLookupByLibrary.simpleMessage('البيانات'),
    'settings_delete_played_label': MessageLookupByLibrary.simpleMessage('حذف الحلقات المحملة بعد تشغيلها'),
    'settings_download_sd_card_label': MessageLookupByLibrary.simpleMessage('تحميل الحلقات على بطاقة SD'),
    'settings_download_switch_card': MessageLookupByLibrary.simpleMessage('سيتم حفظ التنزيلات الجديدة على بطاقة SD. ستبقى التنزيلات الحالية على التخزين الداخلي.'),
    'settings_download_switch_internal': MessageLookupByLibrary.simpleMessage('سيتم حفظ التنزيلات الجديدة على التخزين الداخلي. ستبقى التنزيلات الحالية على بطاقة SD.'),
    'settings_download_switch_label': MessageLookupByLibrary.simpleMessage('تغيير موقع التخزين'),
    'settings_episodes_divider_label': MessageLookupByLibrary.simpleMessage('الحلقات'),
    'settings_export_opml': MessageLookupByLibrary.simpleMessage('تصدير OPML'),
    'settings_import_opml': MessageLookupByLibrary.simpleMessage('استيراد OPML'),
    'settings_label': MessageLookupByLibrary.simpleMessage('الإعدادات'),
    'settings_mark_deleted_played_label': MessageLookupByLibrary.simpleMessage('وضع علامة على الحلقات المحذوفة كمشغلة'),
    'settings_personalisation_divider_label': MessageLookupByLibrary.simpleMessage('التخصيص'),
    'settings_playback_divider_label': MessageLookupByLibrary.simpleMessage('التشغيل'),
    'settings_theme': MessageLookupByLibrary.simpleMessage('المظهر'),
    'settings_theme_heading': MessageLookupByLibrary.simpleMessage('اختر المظهر'),
    'settings_theme_value_auto': MessageLookupByLibrary.simpleMessage('مظهر النظام'),
    'settings_theme_value_dark': MessageLookupByLibrary.simpleMessage('المظهر الداكن'),
    'settings_theme_value_light': MessageLookupByLibrary.simpleMessage('المظهر الفاتح'),
    'share_episode_option_label': MessageLookupByLibrary.simpleMessage('مشاركة الحلقة'),
    'share_podcast_option_label': MessageLookupByLibrary.simpleMessage('مشاركة البودكاست'),
    'show_notes_label': MessageLookupByLibrary.simpleMessage('ملاحظات العرض'),
    'sleep_episode_label': MessageLookupByLibrary.simpleMessage('نهاية الحلقة'),
    'sleep_minute_label': m12,
    'sleep_off_label': MessageLookupByLibrary.simpleMessage('إيقاف'),
    'sleep_timer_label': MessageLookupByLibrary.simpleMessage('مؤقت السكون'),
    'stop_download_button_label': MessageLookupByLibrary.simpleMessage('إيقاف'),
    'stop_download_confirmation': MessageLookupByLibrary.simpleMessage('هل أنت متأكد أنك تريد إيقاف هذا التنزيل وحذف الحلقة؟'),
    'stop_download_title': MessageLookupByLibrary.simpleMessage('إيقاف التنزيل'),
    'subscribe_button_label': MessageLookupByLibrary.simpleMessage('متابعة'),
    'subscribe_label': MessageLookupByLibrary.simpleMessage('متابعة'),
    'time_minutes': m13,
    'time_seconds': m14,
    'time_semantic_minutes': m15,
    'time_semantic_seconds': m16,
    'transcript_label': MessageLookupByLibrary.simpleMessage('النص المكتوب'),
    'transcript_why_not_label': MessageLookupByLibrary.simpleMessage('لماذا لا؟'),
    'transcript_why_not_url': MessageLookupByLibrary.simpleMessage('https://anytimeplayer.app/docs/anytime_transcript_support_ar.html'),
    'unsubscribe_button_label': MessageLookupByLibrary.simpleMessage('إلغاء المتابعة'),
    'unsubscribe_label': MessageLookupByLibrary.simpleMessage('إلغاء المتابعة'),
    'unsubscribe_message': MessageLookupByLibrary.simpleMessage('إلغاء المتابعة سيحذف جميع الحلقات المحملة من هذا البودكاست.'),
    'up_next_queue_label': MessageLookupByLibrary.simpleMessage('التالي')
  };
}
