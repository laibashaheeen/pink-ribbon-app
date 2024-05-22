


class FAQModel {
  
  String question;
  String answer;
  FAQModel({required this.question, required this.answer});
}

List<FAQModel> faqItem = [
  FAQModel(question: 'What is Cancer?', answer: "A term for diseases in which abnormal cells divide without control and can invade nearby tissues. Cancer cells can also spread to other parts of the body through the blood and lymph systems."),
  FAQModel(question: 'What is Tumour?', answer: "An abnormal mass of tissue that results when cells divide more than they should or do not die when they should. Tumors may be benign (not cancer), or malignant (cancer). Also called neoplasm."),
  FAQModel(question: 'What are the different types (benign & malignant) of tumors?',  answer: "Normal cells in the breast and other parts of the body grow and divide to form new cells as they are needed. When normal cells grow old or get damaged, they die, and new cells take their place. Sometimes, this process goes wrong. New cells form when the body doesn’t need them, and old or damaged cells don’t die as they should. The buildup of extra cells often forms a mass of tissue called a lump, growth, or tumor. Tumors in the breast can be benign (not cancer) or malignant (cancer): \nBenign tumors:\n\nAre usually not harmful\nRarely invade the tissues around them\nDon’t spread to other parts of the body\nCan be removed and usually don’t grow back\n\nMalignant tumors:\nMay be a threat to life\nCan invade nearby organs and tissues (such as the chest wall)\nCan spread to other parts of the body\nOften can be removed but sometimes grow back"),
  FAQModel(question: 'What are the common (ductal or lobular) types of carcinomas?',  answer: "The most common type of breast cancer is ductal carcinoma. This cancer begins in cells that line a breast duct. Most women with breast cancer have ductal carcinoma.\n\nThe second most common type of breast cancer is lobular carcinoma. This cancer begins in a lobule of the breast. Few women with breast cancer has lobular carcinoma.\nOther women have a mixture of ductal and lobular type or they have a less common type of breast cancer."),
  FAQModel(question: 'Are all breast lumps cancerous?',  answer: "Not all breast lumps are cancerous. Some are benign. There are many possible causes of non-cancerous (benign) breast lumps. Two of the most common causes of benign single breast lumps are cysts and fibroadenomas. In addition, several other conditions can present themselves as lumps, such as fat necrosis and sclerosing adenosis. Only your healthcare provider can diagnose your breast lump."),
  FAQModel(question: 'What is metastatic breast cancer?',  answer: "When breast cancer spreads from its original place to another part of the body, the new tumor has the same kind of abnormal cells and the same name as the primary (original) tumor. For example, if breast cancer spreads to a lung, the cancer cells in the lung are actually breast cancer cells. The disease is metastatic breast cancer, not lung cancer. For that reason, it’s treated as breast cancer, not lung cancer"),
  FAQModel(question: 'What is brachytherapy?',  answer: "A type of radiation therapy in which radioactive material sealed in needles, seeds, wires, or catheters is placed directly into or near a tumor. Also called implant radiation therapy, internal radiation therapy, and radiation brachytherapy"),
  FAQModel(question: 'What is a mammogram?',  answer: "Mammogram is a specific type of breast imaging that uses low-dose x-rays to detect cancer."),
  FAQModel(question: 'What is malignant?',  answer: "It means Cancerous. Malignant tumors can invade and destroy nearby tissue and spread to other parts of the body."),
  FAQModel(question: 'What is lymphedema?',  answer: "A condition in which excess fluid collects in tissue and causes swelling. It may occur in the arm or leg after lymph vessels or lymph nodes in the underarm or groin are removed or treated with radiation."),
   FAQModel(question: 'What is lumpectomy?',  answer: "Surgery to remove abnormal tissue or cancer from the breast and a small amount of normal tissue around it. It is a type of breast-sparing surgery."),
];