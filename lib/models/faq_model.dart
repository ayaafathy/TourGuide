class FAQ {
  FAQ(this.id, this.q, this.a);

  int id;
  String q;
  String a;
}

class FAQs {
  List<FAQ> faqList = [
    FAQ(1, 'How to change theme?', 'Settings > Appearance > Theme'),
    FAQ(2, 'What names are allowed?',
        "You can choose any name without special characters other than '_'"),
    FAQ(3, 'How to change my email?', 'Settings > Edit Profile > linked email'),
  ];

  List getList(int index) {
    return [faqList[index].id, faqList[index].q, faqList[index].a];
  }
}
