<h1 align="center">
  <img src="images/nerd-fonts-logo.svg" alt="Nerd Fonts Logo" />
</h1>
<h2 align="center">
  <img alt="Iconic font aggregator, collection, and patcher" src="images/project-subtitle-phrase.svg">
</h2>
<div align="center">

[Releases][release]&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Fonts](#patched-fonts)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Font Patcher](#font-patcher)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Wiki Documentation][wiki]&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Stickers][stickers]&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[VimDevIcons][vim-devicons]

[![GitHub release][img-version-badge]][repo][![Gitter][img-gitter-badge]][gitter][![Code of Conduct][coc-badge]][coc][![PRs Welcome][prs-badge]][prs]<a href="#patched-fonts" title=""><img src="https://raw.githubusercontent.com/wiki/ryanoasis/nerd-fonts/images/faux-shield-badge-os-logos.svg?sanitize=true" alt="Nerd Fonts - OS Support"></a>[![Twitter][twitter-badge]][twitter-intent]

</div>

**Nerd Fonts** एक प्रोजेक्ट है जो डेवलपर लक्षित फोंट को उच्च संख्या में ग्लिफ़ (आइकन) के साथ पैच करता है। विशेष रूप से लोकप्रिय 'प्रतिष्ठित फ़ॉन्ट्स' जैसे कि . से अधिक संख्या में अतिरिक्त ग्लिफ़ जोड़ने के लिए [फ़ॉन्ट विस्मयकारी][font-awesome], [डेविकॉन्स][vorillaz-devicons], [अष्टक][octicons], तथा [अन्य](#glyph-sets).

निम्नलिखित संकी प्रवाह आरेख में वर्तमान ग्लिफ़ सेट शामिल हैं:

<p align="center">
  <img src="images/sankey-glyphs-combined-diagram.svg" alt="@SankeyMATIC Diagram" />
</p>
<sub><i>आरेख का उपयोग करके बनाया गया<a href="http://sankeymatic.com/" title="SankeyMATIC (BETA): A Sankey diagram builder for everyone">@SankeyMATIC</a></i></sub>

## महत्वपूर्ण सूचना

-   `master`शाखा फ़ाइल पथ स्थिर **नहीं**  माना जाता है।[अपने भंडार URI संदर्भों को सत्यापित करें](#unstable-file-paths)
-   इस रिपॉजिटरी की क्लोनिंग अनुशंसित **नहीं** है   ([रेपो आकार के कारण](#option-5-clone-the-repo)) जब तक आप [विकास में योगदान](#contributing) देना नहीं जा रहे हैं 

## विषयसूची

[**टीएल; डॉ**](#tldr)

[**स्थापना विकल्प**](#font-installation)

-   [**1 - मैनुअल**](#option-1-download-and-install-manually)
-   [**2 - रिलीज आच्‌ाइव डाउनलोड**](#option-2-release-archive-download)
-   [**3 - स्क्रिप्ट स्थापित करें**](#option-3-install-script)
-   [**4 - होमब्रू फ़ॉन्ट्स (मैकोज़ (ओएस एक्स))**](#option-4-homebrew-fonts)
-   [**5 - क्लोन रेपो**](#option-5-clone-the-repo)
-   [**6 - तदर्थ कर्ल डाउनलोड**](#option-6-ad-hoc-curl-download)
-   [**7 - आर्च यूजर रिपॉजिटरी (और) (आर्च लिनक्स)**](#option-7-unofficial-arch-user-repository-aur)
-   [**8 - अपना खुद का फ़ॉन्ट पैच करें**](#option-8-patch-your-own-font)

[**विशेषताएं**](#features)

-   [**ग्लिफ़/आइकन सेट**](#glyph-sets)
-   [**पैच किए गए फ़ॉन्ट्स**](#patched-fonts)
-   [**युग्म**](#combinations)
-   [**फ़ॉन्ट पैचर**](#font-patcher)

[**डेवलपर / योगदानकर्ता**](#font-patcher)

-   [**फ़ॉन्ट पैचर**](#font-patcher)
-   [**उन्हें सभी फ़ॉन्ट पैचर को पैच करना होगा!**](#gotta-patch-em-all)
-   [**पैच करने के लिए अन्य अच्छे फ़ॉन्ट्स**](#other-good-fonts-to-patch)
-   [**योगदान**](#contributing)

[**परियोजना प्रेरणा**](#project-motivation)

**अतिरिक्त जानकारी**

-   [**मास्टर पर अस्थिर फ़ाइल पथ**](#unstable-file-paths)
-   [**बदलाव का**](#changelog)
-   [**लाइसेंस**](#license)

## टीएल; डॉ

Nerd Fonts लोकप्रिय प्रोग्रामिंग फोंट लेता है और Glyphs का एक गुच्छा जोड़ता है।
  वहाँ भी है एक [फ़ॉन्ट पैचर](#font-patcher) उपलब्ध है यदि आपका वांछित फ़ॉन्ट पहले से पैच नहीं है।
  अधिक उच्च स्तरीय जानकारी के लिए देखें [विकि][wiki]. यदि आप विम प्लगइन की तलाश में हैं तो देखें [विम देव चिह्न][vim-devicons].

### फ़ॉन्ट्स के लिए विभिन्न डाउनलोड विकल्प

_अगर तुम..._

-   `विकल्प 1.`चाहना**जल्दी जल्दी**एक को पकड़ो**व्यक्तिगत फ़ॉन्ट**से डाउनलोड करें[`patched-fonts/`निर्देशिका](#patched-fonts)
-   `विकल्प 2.`डाउनलोड करना चाहते हैं**फ़ॉन्ट परिवार**विविधताओं का पैकेज (बोल्ड, इटैलिक, आदि) देखें[एक संग्रह डाउनलोड करें](#option-2-release-archive-download)
-   `विकल्प 3.`चाहना**स्वचालित**में स्थापित करना या उपयोग करना**स्क्रिप्ट**देखें[स्क्रिप्ट स्थापित करें](#option-3-install-script)
-   `विकल्प 4.`में हैं**मैक ओएस**और उपयोग करना चाहते हैं**होमब्रू**देख[Homebrew फ़ॉन्ट्स](#option-4-homebrew-fonts)
-   `विकल्प 5.`चाहते हैं**पूर्ण नियंत्रण**फिर देखें[रेपो की क्लोनिंग](#option-5-clone-the-repo)
-   `विकल्प 6.`का उपयोग करना चाहते हैं**`curl`आदेश**या में उपयोग करें**स्क्रिप्ट**देख[तदर्थ कर्ल डाउनलोड](#option-6-ad-hoc-curl-download)
-   `विकल्प 7.`में हैं**आच्‌ लिनक्स**और उपयोग करना चाहते हैं**और पैकाग्रेस**देख[अनौपचारिक आच्‌ उपयोगकर्ता भंडार](#option-7-unofficial-arch-user-repository-aur)
-   `विकल्प 8.`अपना खुद का फॉन्ट पैच करना चाहते हैं देखें[फ़ॉन्ट पैचर](#option-8-patch-your-own-font)

## विशेषताएं

-   ए[FontForge पायथन लिपि](#font-patcher)किसी भी फॉन्ट को पैच करने के लिए
    -   बनाने का विकल्प शामिल है**मोनोस्पेस्ड (फिक्स्ड-पिच, फिक्स्ड-चौड़ाई)**_या_**डबल-चौड़ाई (गैर-मोनोस्पेस्ड)**ग्लिफ़
    -   अधिक जानकारी के लिए देखें[**फ़ॉन्ट पैचर**](#font-patcher)अनुभाग
-   **`51`**पहले से ही[पैच किए गए फ़ॉन्ट परिवार](#patched-fonts)
-   ऊपर**`1,444,400`**पैच किए गए फोंट के अद्वितीय संयोजन / विविधताएं[(अधिक जानकारी)](#combinations)
-   ऊपर**`2,824`**ग्लिफ़/आइकन संयुक्त[(अधिक जानकारी)](#combinations)
    -   वर्तमान ग्लिफ़ सेट में शामिल हैं:[अतिरिक्त प्रतीकों के साथ पावरलाइन][ryanoasis-powerline-extra-symbols],[फ़ॉन्ट विस्मयकारी][font-awesome],[सामग्री डिजाइन प्रतीक][font-material-design-icons],[मौसम][font-weather],[देवीकॉन्स][vorillaz-devicons],[ऑक्टिकॉन्स][octicons],[फ़ॉन्ट लोगो][font-logos],[पोमीकॉन्स][gabrielelana-pomicons]
-   **मोनोस्पेस्ड (फिक्स्ड-पिच, फिक्स्ड-चौड़ाई)**_या_**डबल-चौड़ाई (गैर-मोनोस्पेस्ड)**प्रत्येक फ़ॉन्ट का ग्लिफ़ संस्करण
    -   यह नर्ड फॉन्ट ग्लिफ़ को संदर्भित करता है, जरूरी नहीं कि यह पूरी तरह से फ़ॉन्ट हो
-   एक डेवलपर/योगदानकर्ता प्रदान किया गया[बैश स्क्रिप्ट](#gotta-patch-em-all)सभी फोंट को फिर से पैच करने के लिए

## ग्लिफ़ सेट

:mag: :mag: अब आप ग्लिफ़ को आसानी से खोज सकते हैं[नरदफोनट्स.कॉम][Cheat Sheet]के माध्यम से[प्रवंचक पत्रक][]

देखो[विकी: अधिक जानकारी के लिए ग्लिफ़ सेट और कोडप्वाइंट][wiki-glyph-sets-codepoints]

### शेल में चिह्न नाम

देखो[विकी: शेल में चिह्न नाम][wiki-icon-names-in-shell]

## पैच किए गए फ़ॉन्ट्स

| फ़ॉन्ट का नाम                                            | फ़ॉन्ट नाम और रिपोजिटरी               | \*आरएफएन | ईएम आकार | स्थिति           |
| :------------------------------------------------------- | :------------------------------------ | :------- | :------- | :--------------- |
| [3270 बेवकूफ फ़ॉन्ट][p-3270]                             | [3270][f-3270]                        | नहीं     | 1000     | ![w]![m2]![l]    |
| [रामबांस][p-agave]                                       | [रामबांस][f-agave]                    | नहीं     | 2048     | ![w]![m2]![l]    |
| [बेनामी Nerd Font][p-anonymous-pro]                      | [बेनामी प्रो][f-a-pro]                | नहीं     | 2048     | ![w]![m2]![l]    |
| [अरिमो][p-arimo]                                         | [अरिमो][f-arimo]                      | नहीं     | 2048     | ![w]![m2]![l]    |
| [ऑरुलेंट सैंस मोनो नर्ड Font][p-aurulent]                |                                       | नहीं     | 1000     | ![w]![m2]![l]    |
| [बिगब्लूटर्मिनल][p-bigblueterm]                          |                                       | नहीं     | 1200     | ![w]![m2]![l]    |
| [बिटस्ट्रीम वेरा सैन्स मोनो नर्ड फ़ॉन्ट][p-bitstream]    |                                       | नहीं     | 2048     | ![w]![m2]![l]    |
| [ब्लेक्स\*][p-blex]                                      | [आईबीएम प्लेक्स मोनो][f-ibm-plex]     | हां      | 1000     | ![w]![m2]![l]    |
| [Caskaydia Cove Nerd फ़ॉन्ट\*][p-cascadia]               | [कैस्केडिया कोड][f-cascadia]          | हां      | 2048     | ![w]![m2]![l]    |
| [कोड न्यू रोमन नर्ड Font][p-code-nr]                     |                                       | नहीं     | 2048     | ![w]![m2]![l]    |
| [चचेरे भाई बेवकूफ फ़ॉन्ट][p-cousine]                     | [चचेरा भाई][f-cousine]                | नहीं     | 1000     | ![w]![m2]![l]    |
| [डैडीटाइममोनो][p-daddytimemono]                          | [डैडीटाइममोनो][f-daddytimemono]       | नहीं     | 1024     | ![w]![m2]![l]    |
| [DepartureMono Nerd Font][p-departuremono]        | [Departure Mono][f-departuremono] | नहीं     | 550      | ![w] ![m2] ![l]   |
| [देजाव का व्यक्ति rd फोन को महत्व देता है][p-dejavu]     |                                       | नहीं     | 2048     | ![w]![m2]![l]    |
| [Droid Sans Mono Nerd Font][p-droid]                     |                                       | नहीं     | 2048     | ![w]![m2]![l]    |
| [सनकी बिना बेवकूफ Font][p-fantasque]                     | [बिना बढ़िया][f-fant]                 | नहीं     | 2048     | ![w]![m2]![l]    |
| [फिरा कोड बेवकूफ फ़ॉन्ट][p-fira-code]                    | [फिरा कोड][f-fira-code]               | नहीं     | 1000     | ![w]![m2]![l]    |
| [फिला पर्सन वैल्यू rd फोन टी][p-fira-mono]               | [निष्पक्ष][f-fira-mono]               | नहीं     | 1000     | ![w]![m2]![l]    |
| [व्यक्ति मूल्य rd फोन t][p-go-mono]                      | [व्यक्ति][f-go-mono]                  | नहीं     | 1000     | ![w]![m2]![l]    |
| [गोहू नर्ड फ़ॉन्ट][p-gohu]                               | [गोहू टीटीएफ][f-gohu2],[गोहु][f-gohu] | नहीं     | 1000     | ![w]![m2]![l]    |
| [हैक बेवकूफ फ़ॉन्ट][p-hack]                              | [किराये का][f-hack]                   | नहीं     | 2048     | ![w]![m2]![l]    |
| [हास्कलग बेवकूफ फ़ॉन्ट\*][p-hasklig]                     | [हेस्टी][f-hasklig]                   | हां      | 1000     | ![w]![m2]![l]    |
| [भारी डेटा मोनो बेवकूफ फ़ॉन्ट][p-heavy-data]             |                                       | नहीं     | 2048     | ![w]![m2]![l]    |
| [हर्मिट नर्ड फ़ॉन्ट][p-hermit]                           |                                       | नहीं     | 1000     | ![w]![m2]![l]    |
| [में लिख रहा हुँ\*][p-im-writing]                        | [आईए-लेखक][f-ia-writer]               | हां      | 1000     | ![w]![m2]![l]    |
| [Inconsolata Nerd Font][p-inconsolata]                   |                                       | नहीं     | 1000     | ![w]![m2]![l]    |
| [Inconsolata Go Nerd Font][p-inconsolata-go]             |                                       | नहीं     | 1000     | ![w]![m2]![l]    |
| [Inconsolata LGC Nerd Font][p-inconsolata-lgc]           |                                       | नहीं     | 1000     | ![w]![m2]![l]    |
| [Iosevka Nerd Font][p-iosevka]                           | [इओसेवका][f-iosevka]                  | नहीं     | 1000     | [#83][s-iosevka] |
| [जेटब्रेन मोनो][p-jetbrains-mono]                        | [जेटब्रेन मोनो][f-jetbrains-mono]     | नहीं     | 1000     | ![w]![m2]![l]    |
| [Lekton Nerd Font][p-lekton]                             |                                       | नहीं     | 1000     | ![w]![m2]![l]    |
| [इटेराचियन मोनोन आरडी फ़ॉन्ट \*][p-liberation]           | [मुक्ति][f-liberation]                | हां      | 2048     | ![w]![m2]![l]    |
| [लिलेक्स Nerd Font][p-lilex]                             | [लिलेक्स][f-lilex]                    | नहीं     | 2000     | ![w2]![m2]![l]   |
| [मेस्लो नर्ड फ़ॉन्ट][p-meslo]                            |                                       | नहीं     | 2048     | ![w]![m2]![l]    |
| [मोनोफुर नर्ड फ़ॉन्ट][p-monofur]                         |                                       | नहीं     | 2400     | ![w]![m2]![l]    |
| [Monoid Nerd Font][p-monoid]                             |                                       | नहीं     | 1536     | ![w]![m2]![l]    |
| [ट्री वैल्यू rd फोन t][p-mononoki]                       | [चीजों का पेड़][f-mononoki]           | नहीं     | 1024     | ![w]![m2]![l]    |
| [M+ (MPlus) Nerd Font][p-mplus]                          |                                       | नहीं     | 1000     | ![w]![m2]![l]    |
| [ज्ञात][p-noto]                                          |                                       | नहीं     | 1000     | ![w]![m2]![l]    |
| [ओपन डिस्लेक्सिक][p-opendyslexic]                        |                                       | नहीं     | 1000     | ![w]![m2]![l]    |
| [पुल][p-overpass]                                        |                                       | नहीं     | 1000     | ![w]![m2]![l]    |
| [ProFont (Windows tweaked) Nerd Font][p-profont]         |                                       | नहीं     | 1200     | ![w]![m2]![l]    |
| [ProFont (x11) Nerd Font][p-profont]                     |                                       | नहीं     | 1000     | ![w]![m2]![l]    |
| [ProggyClean Nerd Font][p-proggy-clean]                  |                                       | नहीं     | 2048     | अपूर्ण           |
| [रोबोट मोनो][p-roboto]                                   |                                       | नहीं     | 2048     | ![w]![m2]![l]    |
| [सॉस कोड बेवकूफ फ़ॉन्ट][p-source-code-pro]               | [स्रोत][f-source]                     | हां      | 1000     | ![w]![m2]![l]    |
| [शुरे ते च बात ने आरडी फॉन्ट \*][p-share-tech-mono]      | [फैशनेबल हाथ च व्यक्ति][f-share]      | हां      | 1000     | ![w]![m2]![l]    |
| [अंतरिक्ष मोनो बेवकूफ फ़ॉन्ट][p-space-mono]              | [अंतरिक्ष मोनो][f-space]              | नहीं     | 1000     | ![w]![m2]![l]    |
| [टर्मिनेस नर्ड फ़ॉन्ट\*][p-terminus]                     | [टर्मिनस फ़ॉन्ट][f-terminus]          | हां      | 1000     | ![w]![m2]![l]    |
| [टिनोस][p-tinos]                                         |                                       | नहीं     | 2048     | ![w]![m2]![l]    |
| [उबंटू बेवकूफ फ़ॉन्ट][p-ubuntu]                          |                                       | नहीं     | 1000     | ![w]![m2]![l]    |
| [Ubunz व्यक्ति rd फोन को महत्व देता है t][p-ubuntu-mono] |                                       | नहीं     | 1000     | ![w]![m2]![l]    |
| [विक्टर मोनो][p-victor]                                  | [विक्टर मोनो][f-victor]               | नहीं     | 1000     | ![w]![m2]![l]    |

<sub>_\*RFN = आरक्षित फ़ॉन्ट नाम_</sub>

## युग्म

-   ऊपर**`1,485,000`**पैच किए गए फोंट के अद्वितीय रूपांतर/संयोजन (पावर सेट):
    -   **`50`**पैच किए गए फ़ॉन्ट टाइपफेस
    -   **`719`**पैच किए गए फ़ॉन्ट परिवार
    -   **`9,000+`**'पूर्ण' विविधताएं/संयोजन
    -   **`'1,485,410'`**_संभव_विविधताएं/संयोजन
    -   -   **`1,488,286`**कुल परिकलित संयोजन (2,876 + 1,428,110)
-   प्रत्येक फ़ॉन्ट के लिए संयोजन का कोई संयोजन है[बदलाव](#variations)

### बदलाव

-   कोई फ़्लैग नहीं दिया गया (डिफ़ॉल्ट रूप से केवल**सेटी-ओए + बुश**तथा**[देवीकॉन्स][vorillaz-devicons]**)
-   **दोहरा_(चर/आनुपातिक)_**या**एक_(फिक्स्ड/मोनोस्पेस्ड)_**चौड़ाई ग्लिफ़
-   [फ़ॉन्ट विस्मयकारी][font-awesome]
-   [फ़ॉन्ट विस्मयकारी एक्सटेंशन][font-awesome-extension]
-   [सामग्री डिजाइन प्रतीक][font-material-design-icons]
-   [मौसम][font-weather]
-   [गिटहब ऑक्टिकॉन्स][octicons]
-   [फ़ॉन्ट लोगो][font-logos](पूर्व में[फ़ॉन्ट लिनक्स][font-logos])
-   [पावरलाइन अतिरिक्त प्रतीक][ryanoasis-powerline-extra-symbols]
-   [आईईसी पावर प्रतीक][website-iecpower]
-   [पोमीकॉन्स][gabrielelana-pomicons]
-   विंडोज संगतता

## फ़ॉन्ट स्थापना

### `विकल्प 1: मैन्युअल रूप से डाउनलोड और इंस्टॉल करें`

> के लिए सबसे अच्छा विकल्प**जल्दी जल्दी**एक विशिष्ट प्राप्त करना**व्यक्तिगत फ़ॉन्ट**.

विशिष्ट डाउनलोड करें[पैच किया हुआ फ़ॉन्ट](#patched-fonts)तुम्हारी पसन्द का

### `विकल्प 2: रिलीज आच्‌ाइव डाउनलोड`

> सबसे अच्छा विकल्प यदि आप चाहते हैं a**संग्रह**या पूर्ण**फ़ॉन्ट परिवार**विविधताओं की (बोल्ड, इटैलिक, आदि)।

फ़ॉन्ट्स पैकेज के रूप में डाउनलोड के लिए उपलब्ध हैं[नवीनतम प्रकाशन](https://github.com/ryanoasis/nerd-fonts/releases/latest)

### `विकल्प 3: स्क्रिप्ट स्थापित करें`

> सबसे अच्छा विकल्प यदि आप चाहते हैं**स्वचालित**स्थापित करने या उपयोग के लिए**स्क्रिप्ट**.

_ध्यान दें_:**क्लोनिंग की आवश्यकता है**अभी तक रेपो

#### सभी फोंट:

-   सभी पैच किए गए फ़ॉन्ट्स को स्थापित करता है (_चेतावनी: यह बहुत सारे फ़ॉन्ट हैं जो बड़े आकार में जुड़ रहे हैं_)

```sh
./install.sh
```

या, पॉवर्सशेल (केवल विंडोज़) में:

```pwsh
./install.ps1
```

#### एकल फ़ॉन्ट:

-   अपनी पसंद का एक ही फॉन्ट इंस्टाल करता है

```sh
./install.sh <FontName>
./install.sh Hack
./install.sh HeavyData
```

या, पॉवर्सशेल (केवल विंडोज़) में:

```pwsh
./install.ps1 <FontName>
./install.ps1 Hack
./install.ps1 HeavyData
./install.ps1 FiraCode, Hack
./install.ps1 CascadiaCode -WindowsCompatibleOnly
./install.ps1 DejaVuSansMono -WhatIf
```

### `विकल्प 4: होमब्रू फ़ॉन्ट्स`

> सबसे अच्छा विकल्प अगर चालू है**मैक ओएस**और उपयोग करना चाहते हैं**होमब्रू**.

सभी फोंट के माध्यम से उपलब्ध हैं[Homebrew पीपा फ़ॉन्ट्स](https://github.com/Homebrew/homebrew-cask)मैकोज़ (ओएस एक्स) पर

```sh
brew install font-hack-nerd-font
```

_On Linux you have to add `--cask` after `install`._

### `विकल्प 5: रेपो का क्लोन बनाएं`

> के लिए सबसे अच्छा विकल्प**पूर्ण नियंत्रण**,**सब**या**कुछ**फोंट के, या**योगदान**विकास के लिए।

इस भंडार का एक पूर्ण क्लोन है**नहीं**आवश्यक और न ही कुशल (ज्यादातर रिपोजिटरी आकार के कारण) यदि आप केवल फोंट के सीमित सेट में रुचि रखते हैं।

यदि आप संपूर्ण रेपो को क्लोन करना चाहते हैं तो सुनिश्चित करें_उथला_क्लोन:

```sh
git clone --depth 1
```

यदि आप उप-निर्देशिका को क्लोन करना चाहते हैं, तो उपयोग करें`git sparse-checkout`. निम्नलिखित उदाहरण की आवश्यकता है`Git v2.26`:

```sh
git clone --filter=blob:none --sparse git@github.com:ryanoasis/nerd-fonts
cd nerd-fonts
git sparse-checkout add patched-fonts/JetBrainsMono
```

### `विकल्प 6:तदर्थ कर्ल डाउनलोड`

> विकल्प यदि आप उपयोग करना चाहते हैं**`curl`आदेश**या में उपयोग के लिए**स्क्रिप्ट**.

#### लिनक्स

```sh
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
```

_ध्यान दें:_बहिष्कृत वैकल्पिक पथ:`~/.fonts`

#### मैकओएस (ओएस एक्स)

```sh
cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
```

### `विकल्प 7: अनौपचारिक आच्‌ यूजर रिपोजिटरी (AUR)`

> के लिए विकल्प**आच्‌ लिनक्स**और उपयोग करना चाहते हैं**और पैकाग्रेस**.

निम्नलिखित फोंट के माध्यम से उपलब्ध हैं[और पैकाग्रेस](https://aur.archlinux.org/)आच्‌ लिनक्स पर:

* [Nerd Fonts Complete Release (double-width)](https://aur.archlinux.org/packages/nerd-fonts-complete/)
* [Nerd Fonts Complete Release (single-width) (out of date)](https://aur.archlinux.org/packages/nerd-fonts-complete-mono-glyphs/)
* [Nerd Fonts Complete Git (has always the newest fixes)](https://aur.archlinux.org/packages/nerd-fonts-git/)

* [Nerd Fonts Anonymous Pro](https://aur.archlinux.org/packages/nerd-fonts-anonymous-pro/)
* [Nerd Fonts DejaVu Complete](https://aur.archlinux.org/packages/nerd-fonts-dejavu-complete/)
* [Nerd Fonts Fira Code](https://aur.archlinux.org/packages/nerd-fonts-fira-code/)
* [Nerd Fonts Go Mono](https://aur.archlinux.org/packages/nerd-fonts-go-mono/)
* [Nerd Fonts Hack](https://archlinux.org/packages/community/any/ttf-hack-nerd/)
* [Nerd Fonts Inconsolata](https://aur.archlinux.org/packages/nerd-fonts-inconsolata/)
* [Nerd Fonts Jetbrains Mono](https://aur.archlinux.org/packages/nerd-fonts-jetbrains-mono)
* [Nerd Fonts Liberation Mono](https://aur.archlinux.org/packages/nerd-fonts-liberation-mono/)
* [Nerd Fonts Noto](https://aur.archlinux.org/packages/nerd-fonts-noto/)
* [Nerd Fonts Source Code Pro Complete](https://aur.archlinux.org/packages/nerd-fonts-source-code-pro/)
* [Nerd Fonts Terminus](https://aur.archlinux.org/packages/nerd-fonts-terminus/)
* [Nerd Fonts Victor Mono](https://aur.archlinux.org/packages/nerd-fonts-victor-mono)

The list is not complete, but you can [search for a complete list here](https://aur.archlinux.org/packages?K=nerd-fonts-&outdated=off).

### `विकल्प 8: अपना खुद का फ़ॉन्ट पैच करें`

> के लिए विकल्प**पैचिंग**आपका**खुद का फॉन्ट**या पूरी तरह से**अनुरूपण**पैच किया गया फ़ॉन्ट।

अतिरिक्त नए ग्लिफ़ प्राप्त करने के लिए अपने स्वयं के फ़ॉन्ट से एक पैच किए गए फ़ॉन्ट को उत्पन्न करने के लिए प्रदान की गई पायथन कमांड लाइन स्क्रिप्ट का उपयोग करें

देखो:[फ़ॉन्ट पैचर](#font-patcher)उपयोग के लिए

-   यदि आप करते हैं तो इस विकल्प का उपयोग करें**नहीं**में से किसी एक का उपयोग करना चाहते हैं[फोंट प्रदान किया गया](#patched-fonts)
-   आपको अभी भी जेनरेट किए गए फ़ॉन्ट को अपने सिस्टम पर सही फ़ॉन्ट निर्देशिका में कॉपी करने की आवश्यकता होगी

<h2 align="center" id="font-patcher">
	<img src="images/nerd-fonts-patcher-logo.png" alt="Nerd Fonts Patcher">
</h2>

के साथ प्रयोग के लिए अपने स्वयं के चयन के फ़ॉन्ट को पैच करना[विम देव चिह्न][vim-devicons]:

-   आवश्यकता है: पायथन 2 (या पायथन 3),`python-fontforge`पैकेज (संस्करण`20141231`या बाद में, देखें
    NS[निर्देश स्थापित करें](http://designwithfontforge.com/en-US/Installing_Fontforge.html))

-   OSX पर वैकल्पिक संस्थापन विधि:`brew install fontforge`

-   Linux पर वैकल्पिक विधि: का उपयोग करना[ऐप इमेज](https://github.com/fontforge/fontforge/releases)

-   डॉकर का उपयोग कर वैकल्पिक विधि:[डोकर हब](https://hub.docker.com/r/nerdfonts/patcher)

-   उपयोग:

        ./font-patcher PATH_TO_FONT

-   वैकल्पिक उपयोग: स्क्रिप्ट ध्वज का उपयोग करके FontForge बाइनरी के साथ पैचर निष्पादित करें:

        ./fontforge -script font-patcher PATH_TO_FONT

-   AppImage का उपयोग करके फोंट को पैच करना:

    _ध्यान दें_:`chmod u+x`AppImage डाउनलोड करने के बाद। सभी आपूर्ति किए गए पथ होने चाहिए**शुद्ध**और एक स्पष्ट आउटपुट पथ की आवश्यकता है! यदि सब कुछ एक ही निर्देशिका में स्थित है, तो आप इसका उपयोग कर सकते हैं`$PWD`आशुलिपि।

        ./FontForge.AppImage -script $PWD/font-patcher $PWD/BaseFont.ttf -out /tmp

-   डॉकर के साथ पैचिंग फोंट:

        docker run -v /path/to/fonts:/in:Z -v /path/for/output:/out:Z nerdfonts/patcher [OPTIONS]

पूर्ण विकल्प:

```
Nerd Fonts Patcher v3.0.2 (4.4.0) (ff 20230101)
usage: font-patcher [-h] [-v] [-s] [-l] [-q] [-c] [--careful] [--removeligs] [--postprocess [POSTPROCESS]] [--configfile [CONFIGFILE]] [--custom [CUSTOM]]
                    [-ext [EXTENSION]] [-out [OUTPUTDIR]] [--glyphdir [GLYPHDIR]] [--makegroups [{-1,0,1,2,3,4,5,6}]] [--variable-width-glyphs]
                    [--has-no-italic] [--progressbars | --no-progressbars] [--debug [{0,1,2,3}]] [--dry] [--xavgcharwidth [XAVGWIDTH]] [--fontawesome]
                    [--fontawesomeextension] [--fontlogos] [--octicons] [--codicons] [--powersymbols] [--pomicons] [--powerline] [--powerlineextra]
                    [--material] [--weather]
                    font

Nerd Fonts Font Patcher: patches a given font with programming and development related glyphs

* Website: https://www.nerdfonts.com
* Version: 3.0.2
* Development Website: https://github.com/ryanoasis/nerd-fonts
* Changelog: https://github.com/ryanoasis/nerd-fonts/blob/-/changelog.md

positional arguments:
  font                  The path to the font to patch (e.g., Inconsolata.otf)

options:
  -h, --help            show this help message and exit
  -v, --version         show program's version number and exit
  -s, --mono            Whether to generate the glyphs as single-width not double-width (default is double-width)
  -l, --adjust-line-height
                        Whether to adjust line heights (attempt to center powerline separators more evenly)
  -q, --quiet, --shutup
                        Do not generate verbose output
  -c, --complete        Add all available Glyphs
  --careful             Do not overwrite existing glyphs if detected
  --removeligs, --removeligatures
                        Removes ligatures specificed in JSON configuration file
  --postprocess [POSTPROCESS]
                        Specify a Script for Post Processing
  --configfile [CONFIGFILE]
                        Specify a file path for JSON configuration file (see sample: src/config.sample.json)
  --custom [CUSTOM]     Specify a custom symbol font, all glyphs will be copied; absolute path suggested
  -ext [EXTENSION], --extension [EXTENSION]
                        Change font file type to create (e.g., ttf, otf)
  -out [OUTPUTDIR], --outputdir [OUTPUTDIR]
                        The directory to output the patched font file to
  --glyphdir [GLYPHDIR]
                        Path to glyphs to be used for patching
  --makegroups [{-1,0,1,2,3,4,5,6}]
                        Use alternative method to name patched fonts (recommended)
  --variable-width-glyphs
                        Do not adjust advance width (no "overhang")
  --has-no-italic       Font family does not have Italic (but Oblique)
  --progressbars        Show percentage completion progress bars per Glyph Set (default)
  --no-progressbars     Don't show percentage completion progress bars per Glyph Set
  --debug [{0,1,2,3}]   Verbose mode (optional: 1=just to file; 2*=just to terminal; 3=display and file)
  --dry                 Do neither patch nor store the font, to check naming
  --xavgcharwidth [XAVGWIDTH]
                        Adjust xAvgCharWidth (optional: concrete value)

Symbol Fonts:
  --fontawesome         Add Font Awesome Glyphs (http://fontawesome.io/)
  --fontawesomeextension
                        Add Font Awesome Extension Glyphs (https://andrelzgava.github.io/font-awesome-extension/)
  --fontlogos, --fontlinux
                        Add Font Logos Glyphs (https://github.com/Lukas-W/font-logos)
  --octicons            Add Octicons Glyphs (https://octicons.github.com)
  --codicons            Add Codicons Glyphs (https://github.com/microsoft/vscode-codicons)
  --powersymbols        Add IEC Power Symbols (https://unicodepowersymbol.com/)
  --pomicons            Add Pomicon Glyphs (https://github.com/gabrielelana/pomicons)
  --powerline           Add Powerline Glyphs
  --powerlineextra      Add Powerline Glyphs (https://github.com/ryanoasis/powerline-extra-symbols)
  --material, --materialdesignicons, --mdi
                        Add Material Design Icons (https://github.com/templarian/MaterialDesign)
  --weather, --weathericons
                        Add Weather Icons (https://github.com/erikflowers/weather-icons)
```

#### उदाहरण

    ./font-patcher Droid\ Sans\ Mono\ for\ Powerline.otf
    ./font-patcher Droid\ Sans\ Mono\ for\ Powerline.otf -s -q
    ./font-patcher Droid\ Sans\ Mono\ for\ Powerline.otf --mono --quiet
    ./font-patcher Droid\ Sans\ Mono\ for\ Powerline.otf -w
    ./font-patcher Droid\ Sans\ Mono\ for\ Powerline.otf --windows --quiet
    ./font-patcher Droid\ Sans\ Mono\ for\ Powerline.otf --windows --pomicons --quiet
    
    ./font-patcher Inconsolata.otf --fontawesome
    ./font-patcher Inconsolata.otf --fontawesome --octicons --pomicons
    ./font-patcher Inconsolata.otf
    
    ./FontForge.AppImage -script /tmp/nerdfonts/font-patcher /tmp/nerdfonts/CascadiaMonoPL-Semibold.ttf --fontawesome -out /tmp
    ./FontForge.AppImage -script $PWD/font-patcher $PWD/CascadiaMonoPL-Semibold.ttf --octicons -out $HOME
    
    docker run --rm -v ~/myfont/patchme:/in:Z -v ~/myfont/patched:/out:Z nerdfonts/patcher
    docker run --rm -v ~/Desktop/myfont/patchme:/in:Z -v ~/Desktop/myfont/patched:/out:Z nerdfonts/patcher --fontawesome

<a name="gotta-patch-em-all"></a>

## उन्हें सभी फ़ॉन्ट पैचर को पैच करना होगा!

-   योगदानकर्ता या डेवलपर उपयोग के लिए

-   पुन: पैच**सब**अप्रकाशित निर्देशिका में फोंट:

        ./gotta-patch-em-all-font-patcher\!.sh

-   वैकल्पिक रूप से विशिष्ट फ़ॉन्ट नाम पैटर्न तक सीमित कर सकते हैं:

        ./gotta-patch-em-all-font-patcher\!.sh Hermit

## योगदान

देखो [कंट्रिब्यूटिंग.मद](contributing.md)

## अस्थिर फ़ाइल पथ

:warning: चेतावनी: रिलीज के आधार पर फ़ाइल पथ बदल सकते हैं (विशेषकर**प्रमुख**संस्करण धक्कों)

संदर्भ **रिहाई** शाखा और _नहीं_ ~~गुरुजी~~ शाखा क्योंकि पथ प्रत्येक रिलीज के लिए परिवर्तन के अधीन हैं

-   उदाहरण के लिए:
    -   :white_check_mark: उपयोग करे<code>https\://github.com/ryanoasis/nerd-fonts/blob/<b>0.9.0</b>/patched-fonts/Hermit/Medium/complete/Hurmit%20Medium%20Nerd%20Font%20Complete.otf</code>
    -   :x: के बजाय:<code>https\://github.com/ryanoasis/nerd-fonts/blob/<del>master</del>/patched-fonts/Hermit/Medium/complete/Hurmit%20Medium%20Nerd%20Font%20Complete.otf</code>

# पैच करने के लिए अन्य अच्छे फ़ॉन्ट्स

पैच करने के लिए अतिरिक्त अच्छे फोंट की एक सूची जो उनके लाइसेंस के कारण प्रदान या साझा नहीं की जा सकती:

-   [इनपुट मोनो][input-mono](लाइसेंस प्रतिबंध)
    -   संभवतः बाहरी होस्टिंग के साथ आ रहा है :)
-   [चीजों के लिए][pragmatapro](खाली नहीं)
-   [शान्ति][consolas](मालिकाना)
-   [ओपेरा और आर व्यक्ति][operator](खाली नहीं)
-   [मोनो . को धन्यवाद][dank](खाली नहीं)

## परियोजना प्रेरणा

देखो[विकी: परियोजना का उद्देश्य][wiki-project-purpose]

## बदलाव का

देखो[चंगेलोग.मद](changelog.md)

## लाइसेंस

[साथ](LICENSE)© रयान एल मैकइंटायर

<!--
Repo References
-->

[vim-devicons]: https://github.com/ryanoasis/vim-devicons "VimDevIcons Vim Plugin (external link) ➶"

[vorillaz-devicons]: https://vorillaz.github.io/devicons/

[font-awesome]: https://github.com/FortAwesome/Font-Awesome

[font-awesome-extension]: https://github.com/AndreLZGava/font-awesome-extension

[font-material-design-icons]: https://github.com/Templarian/MaterialDesign

[font-weather]: https://github.com/erikflowers/weather-icons

[octicons]: https://github.com/primer/octicons

[font-logos]: https://github.com/Lukas-W/font-logos

[gabrielelana-pomicons]: https://github.com/gabrielelana/pomicons

[Seti-UI]: https://atom.io/themes/seti-ui

[ryanoasis-powerline-extra-symbols]: https://github.com/ryanoasis/powerline-extra-symbols

[wiki]: https://github.com/ryanoasis/nerd-fonts/wiki

[wiki-project-purpose]: https://github.com/ryanoasis/nerd-fonts/wiki/Project-Purpose

[wiki-glyph-sets-codepoints]: https://github.com/ryanoasis/nerd-fonts/wiki/Glyph-Sets-and-Code-Points

[wiki-icon-names-in-shell]: https://github.com/ryanoasis/nerd-fonts/wiki/Icon-Names-in-Shell

[repo]: https://github.com/ryanoasis/nerd-fonts

[gitter]: https://gitter.im/ryanoasis/nerd-fonts

[code-climate]: https://codeclimate.com/github/ryanoasis/nerd-fonts

[twitter-intent]: https://twitter.com/intent/tweet?url=https%3A%2F%2Fgithub.com%2Fryanoasis%2Fnerd-fonts&via=%40nerdfonts&text=Nerd%20Fonts%20-%20Iconic%20font%20aggregator%2C%20collection%2C%20and%20patcher&hashtags=iconfont%20font%20github

<!--
Website References
-->

[website-iecpower]: https://unicodepowersymbol.com/

[Cheat Sheet]: https://nerdfonts.com/cheat-sheet

[stickers]: https://www.redbubble.com/people/ryanoasis/works/30764810-nerd-fonts-iconic-font-aggregator

<!--
Link References
-->

[badge-version]: https://badge.fury.io/gh/ryanoasis%2Fnerd-fonts

[badge-gitter]: https://gitter.im/ryanoasis/nerd-fonts?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge

[img-version-badge]: https://img.shields.io/github/release/ryanoasis/nerd-fonts.svg?style=for-the-badge

[img-gitter-badge]: https://img.shields.io/gitter/room/nwjs/nw.js.svg?style=for-the-badge

[img-code-climate-badge]: https://img.shields.io/codeclimate/issues/ryanoasis/nerd-fonts.svg?style=for-the-badge

[coc-badge]: https://img.shields.io/badge/code%20of-conduct-ff69b4.svg?style=for-the-badge

[prs-badge]: https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=for-the-badge&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIGlkPSJzdmcyIiB3aWR0aD0iNjQ1IiBoZWlnaHQ9IjU4NSIgdmVyc2lvbj0iMS4wIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPiA8ZyBpZD0ibGF5ZXIxIj4gIDxwYXRoIGlkPSJwYXRoMjQxNyIgZD0ibTI5Ny4zIDU1MC44N2MtMTMuNzc1LTE1LjQzNi00OC4xNzEtNDUuNTMtNzYuNDM1LTY2Ljg3NC04My43NDQtNjMuMjQyLTk1LjE0Mi03Mi4zOTQtMTI5LjE0LTEwMy43LTYyLjY4NS01Ny43Mi04OS4zMDYtMTE1LjcxLTg5LjIxNC0xOTQuMzQgMC4wNDQ1MTItMzguMzg0IDIuNjYwOC01My4xNzIgMTMuNDEtNzUuNzk3IDE4LjIzNy0zOC4zODYgNDUuMS02Ni45MDkgNzkuNDQ1LTg0LjM1NSAyNC4zMjUtMTIuMzU2IDM2LjMyMy0xNy44NDUgNzYuOTQ0LTE4LjA3IDQyLjQ5My0wLjIzNDgzIDUxLjQzOSA0LjcxOTcgNzYuNDM1IDE4LjQ1MiAzMC40MjUgMTYuNzE0IDYxLjc0IDUyLjQzNiA2OC4yMTMgNzcuODExbDMuOTk4MSAxNS42NzIgOS44NTk2LTIxLjU4NWM1NS43MTYtMTIxLjk3IDIzMy42LTEyMC4xNSAyOTUuNSAzLjAzMTYgMTkuNjM4IDM5LjA3NiAyMS43OTQgMTIyLjUxIDQuMzgwMSAxNjkuNTEtMjIuNzE1IDYxLjMwOS02NS4zOCAxMDguMDUtMTY0LjAxIDE3OS42OC02NC42ODEgNDYuOTc0LTEzNy44OCAxMTguMDUtMTQyLjk4IDEyOC4wMy01LjkxNTUgMTEuNTg4LTAuMjgyMTYgMS44MTU5LTI2LjQwOC0yNy40NjF6IiBmaWxsPSIjZGQ1MDRmIi8%2BIDwvZz48L3N2Zz4%3D

[twitter-badge]: https://img.shields.io/twitter/url/http/shields.io.svg?style=for-the-badge&logo=twitter

[os-badge]: https://img.shields.io/badge/-OS-brightgreen.svg?style=for-the-badge&logoWidth=80&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIHdpZHRoPSIzOS43NDFtbSIgaGVpZ2h0PSIxMy4zNzdtbSIgdmVyc2lvbj0iMS4xIiB2aWV3Qm94PSIwIDAgMzkuNzQxMjggMTMuMzc3MTI3IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOmNjPSJodHRwOi8vY3JlYXRpdmVjb21tb25zLm9yZy9ucyMiIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj48bWV0YWRhdGE%2BPHJkZjpSREY%2BPGNjOldvcmsgcmRmOmFib3V0PSIiPjxkYzpmb3JtYXQ%2BaW1hZ2Uvc3ZnK3htbDwvZGM6Zm9ybWF0PjxkYzp0eXBlIHJkZjpyZXNvdXJjZT0iaHR0cDovL3B1cmwub3JnL2RjL2RjbWl0eXBlL1N0aWxsSW1hZ2UiLz48ZGM6dGl0bGUvPjwvY2M6V29yaz48L3JkZjpSREY%2BPC9tZXRhZGF0YT48ZyB0cmFuc2Zvcm09Im1hdHJpeCguMzMwODMgMCAwIC4zMzA4MyAyNi41MDggLTEuNzc0MikiPjxwb2x5Z29uIHBvaW50cz0iMTcuNCAzOC4zIDIxLjUgNDAuNiAyNy43IDQwLjYgMzMuNSAzNi4yIDM2LjEgMjkuMyAzMC4xIDIyIDI4LjQgMTcuOSAyMC4xIDE4LjIgMjAuMiAyMC41IDE4LjYgMjMuNSAxNi4xIDI4LjQgMTUuNiAzMi41IiBmaWxsPSIjZWNlZmYxIi8%2BPHBhdGggZD0ibTM0LjMgMjMuOWMtMS42LTIuMy0yLjktMy43LTMuNi02LjZzMC4yLTIuMS0wLjQtNC42Yy0wLjMtMS4zLTAuOC0yLjItMS4zLTIuOS0wLjYtMC43LTEuMy0xLjEtMS43LTEuMi0wLjktMC41LTMtMS4zLTUuNiAwLjEtMi43IDEuNC0yLjQgNC40LTEuOSAxMC41IDAgMC40LTAuMSAwLjktMC4zIDEuMy0wLjQgMC45LTEuMSAxLjctMS43IDIuNC0wLjcgMS0xLjQgMi0xLjkgMy4xLTEuMiAyLjMtMi4zIDUuMi0yIDYuMyAwLjUtMC4xIDYuOCA5LjUgNi44IDkuNyAwLjQtMC4xIDIuMS0wLjEgMy42LTAuMSAyLjEtMC4xIDMuMy0wLjIgNSAwLjIgMC0wLjMtMC4xLTAuNi0wLjEtMC45IDAtMC42IDAuMS0xLjEgMC4yLTEuOCAwLjEtMC41IDAuMi0xIDAuMy0xLjYtMSAwLjktMi44IDEuOS00LjUgMi4yLTEuNSAwLjMtNC0wLjItNS4yLTEuNyAwLjEgMCAwLjMgMCAwLjQtMC4xIDAuMy0wLjEgMC42LTAuMiAwLjctMC40IDAuMy0wLjUgMC4xLTEtMC4xLTEuM3MtMS43LTEuNC0yLjQtMi0xLjEtMC45LTEuNS0xLjNsLTAuOC0wLjhjLTAuMi0wLjItMC4zLTAuNC0wLjQtMC41LTAuMi0wLjUtMC4zLTEuMS0wLjItMS45IDAuMS0xLjEgMC41LTIgMS0zIDAuMi0wLjQgMC43LTEuMiAwLjctMS4ycy0xLjcgNC4yLTAuOCA1LjVjMCAwIDAuMS0xLjMgMC41LTIuNiAwLjMtMC45IDAuOC0yLjIgMS40LTIuOXMyLjEtMy4zIDIuMi00LjljMC0wLjcgMC4xLTEuNCAwLjEtMS45LTAuNC0wLjQgNi42LTEuNCA3LTAuMyAwLjEgMC40IDEuNSA0IDIuMyA1LjkgMC40IDAuOSAwLjkgMS43IDEuMiAyLjcgMC4zIDEuMSAwLjUgMi42IDAuNSA0LjEgMCAwLjMgMCAwLjgtMC4xIDEuMyAwLjIgMCA0LjEtNC4yLTAuNS03LjcgMCAwIDIuOCAxLjMgMi45IDMuOSAwLjEgMi4xLTAuOCAzLjgtMSA0LjEgMC4xIDAgMi4xIDAuOSAyLjIgMC45IDAuNCAwIDEuMi0wLjMgMS4yLTAuMyAwLjEtMC4zIDAuNC0xLjEgMC40LTEuNCAwLjctMi4zLTEtNi0yLjYtOC4zeiIgZmlsbD0iIzI2MzIzOCIvPjxnIGZpbGw9IiNlY2VmZjEiPjxlbGxpcHNlIGN4PSIyMS42IiBjeT0iMTUuMyIgcng9IjEuMyIgcnk9IjIiLz48ZWxsaXBzZSBjeD0iMjYuMSIgY3k9IjE1LjIiIHJ4PSIxLjciIHJ5PSIyLjMiLz48L2c%2BPGcgZmlsbD0iIzIxMjEyMSI%2BPGVsbGlwc2UgdHJhbnNmb3JtPSJtYXRyaXgoLS4xMjU0IC0uOTkyMSAuOTkyMSAtLjEyNTQgOC45NzU0IDM4Ljk5NykiIGN4PSIyMS43IiBjeT0iMTUuNSIgcng9IjEuMiIgcnk9Ii43Ii8%2BPGVsbGlwc2UgY3g9IjI2IiBjeT0iMTUuNiIgcng9IjEiIHJ5PSIxLjMiLz48L2c%2BPGcgZmlsbD0iI2ZmYzEwNyI%2BPHBhdGggZD0ibTM5LjMgMzcuNmMtMC40LTAuMi0xLjEtMC41LTEuNy0xLjQtMC4zLTAuNS0wLjItMS45LTAuNy0yLjUtMC4zLTAuNC0wLjctMC4yLTAuOC0wLjItMC45IDAuMi0zIDEuNi00LjQgMC0wLjItMC4yLTAuNS0wLjUtMS0wLjVzLTAuNyAwLjItMC45IDAuNi0wLjIgMC43LTAuMiAxLjdjMCAwLjggMCAxLjctMC4xIDIuNC0wLjIgMS43LTAuNSAyLjctMC41IDMuNyAwIDEuMSAwLjMgMS44IDAuNyAyLjEgMC4zIDAuMyAwLjggMC41IDEuOSAwLjVzMS44LTAuNCAyLjUtMS4xYzAuNS0wLjUgMC45LTAuNyAyLjMtMS43IDEuMS0wLjcgMi44LTEuNiAzLjEtMS45IDAuMi0wLjIgMC41LTAuMyAwLjUtMC45IDAtMC41LTAuNC0wLjctMC43LTAuOHoiLz48cGF0aCBkPSJtMTkuMiAzNy45Yy0xLTEuNi0xLjEtMS45LTEuOC0yLjktMC42LTEtMS45LTIuOS0yLjctMi45LTAuNiAwLTAuOSAwLjMtMS4zIDAuN3MtMC44IDEuMy0xLjUgMS44Yy0wLjYgMC41LTIuMyAwLjQtMi43IDFzMC40IDEuNSAwLjQgM2MwIDAuNi0wLjUgMS0wLjYgMS40LTAuMSAwLjUtMC4yIDAuOCAwIDEuMiAwLjQgMC42IDAuOSAwLjggNC4zIDEuNSAxLjggMC40IDMuNSAxLjQgNC42IDEuNXMzIDAgMy0yLjdjMC4xLTEuNi0wLjgtMi0xLjctMy42eiIvPjxwYXRoIGQ9Im0yMS4xIDE5LjhjLTAuNi0wLjQtMS4xLTAuOC0xLjEtMS40czAuNC0wLjggMS0xLjNjMC4xLTAuMSAxLjItMS4xIDIuMy0xLjFzMi40IDAuNyAyLjkgMC45YzAuOSAwLjIgMS44IDAuNCAxLjcgMS4xLTAuMSAxLTAuMiAxLjItMS4yIDEuNy0wLjcgMC4yLTIgMS4zLTIuOSAxLjMtMC40IDAtMSAwLTEuNC0wLjEtMC4zLTAuMS0wLjgtMC42LTEuMy0xLjF6Ii8%2BPC9nPjxnIGZpbGw9IiM2MzQ3MDMiPjxwYXRoIGQ9Im0yMC45IDE5YzAuMiAwLjIgMC41IDAuNCAwLjggMC41IDAuMiAwLjEgMC41IDAuMiAwLjUgMC4yaDAuOWMwLjUgMCAxLjItMC4yIDEuOS0wLjYgMC43LTAuMyAwLjgtMC41IDEuMy0wLjcgMC41LTAuMyAxLTAuNiAwLjgtMC43cy0wLjQgMC0xLjEgMC40Yy0wLjYgMC40LTEuMSAwLjYtMS43IDAuOS0wLjMgMC4xLTAuNyAwLjMtMSAwLjNoLTAuOWMtMC4zIDAtMC41LTAuMS0wLjgtMC4yLTAuMi0wLjEtMC4zLTAuMi0wLjQtMC4yLTAuMi0wLjEtMC42LTAuNS0wLjgtMC42IDAgMC0wLjIgMC0wLjEgMC4xbDAuNiAwLjZ6Ii8%2BPHBhdGggZD0ibTIzLjkgMTYuOGMwLjEgMC4yIDAuMyAwLjIgMC40IDAuM3MwLjIgMC4xIDAuMiAwLjFjMC4xLTAuMSAwLTAuMy0wLjEtMC4zIDAtMC4yLTAuNS0wLjItMC41LTAuMXoiLz48cGF0aCBkPSJtMjIuMyAxN2MwIDAuMSAwLjIgMC4yIDAuMiAwLjEgMC4xLTAuMSAwLjItMC4yIDAuMy0wLjIgMC4yLTAuMSAwLjEtMC4yLTAuMi0wLjItMC4yIDAuMS0wLjIgMC4yLTAuMyAwLjN6Ii8%2BPC9nPjxwYXRoIGQ9Im0zMiAzNC43djAuM2MwLjIgMC40IDAuNyAwLjUgMS4xIDAuNSAwLjYgMCAxLjItMC40IDEuNS0wLjggMC0wLjEgMC4xLTAuMiAwLjItMC4zIDAuMi0wLjMgMC4zLTAuNSAwLjQtMC42IDAgMC0wLjEtMC4xLTAuMS0wLjItMC4xLTAuMi0wLjQtMC40LTAuOC0wLjUtMC4zLTAuMS0wLjgtMC4yLTEtMC4yLTAuOS0wLjEtMS40IDAuMi0xLjcgMC41IDAgMCAwLjEgMCAwLjEgMC4xIDAuMiAwLjIgMC4zIDAuNCAwLjMgMC43IDAuMSAwLjIgMCAwLjMgMCAwLjV6IiBmaWxsPSIjNDU1YTY0Ii8%2BPC9nPjxnIHRyYW5zZm9ybT0ibWF0cml4KC4xMzk0NSAwIDAgLjEzOTQ1IDAgMS4xNjIzKSI%2BPHBhdGggZD0ibTAgMTIuNDAyIDM1LjY4Ny00Ljg2MDIgMC4wMTU2IDM0LjQyMy0zNS42NyAwLjIwMzEzeiIgZmlsbD0iI2Y4NjgyYyIvPjxwYXRoIGQ9Im0zOS45OTYgNi45MDU5IDQ3LjMxOC02LjkwNnY0MS41MjdsLTQ3LjMxOCAwLjM3NTY1eiIgZmlsbD0iIzkxYzMwMCIvPjxwYXRoIGQ9Im0zNS42NyA0NS45MzEgMC4wMjc3IDM0LjQ1My0zNS42Ny00LjkwNDEtMmUtMyAtMjkuNzh6IiBmaWxsPSIjMDBiNGYxIi8%2BPHBhdGggZD0ibTg3LjMyNiA0Ni4yNTUtMC4wMTExIDQxLjM0LTQ3LjMxOC02LjY3ODQtMC4wNjYzLTM0LjczOXoiIGZpbGw9IiNmZmMzMDAiLz48L2c%2BPHBhdGggZD0ibTI2LjEzNyAxMC4yODRjLTAuMTk5NTggMC40NjEwNi0wLjQzNTgxIDAuODg1NDctMC43MDk1MiAxLjI3NTctMC4zNzMwOCAwLjUzMTkzLTAuNjc4NTYgMC45MDAxMy0wLjkxMzk4IDEuMTA0Ni0wLjM2NDk0IDAuMzM1NjItMC43NTU5NSAwLjUwNzUtMS4xNzQ2IDAuNTE3MjctMC4zMDA1OSAwLTAuNjYzMDgtMC4wODU1My0xLjA4NS0wLjI1OTA0LTAuNDIzMzUtMC4xNzI2OS0wLjgxMjQtMC4yNTgyMy0xLjE2ODEtMC4yNTgyMy0wLjM3MzA4IDAtMC43NzMyMiAwLjA4NTU0LTEuMjAxMiAwLjI1ODIzLTAuNDI4NjQgMC4xNzM1MS0wLjc3Mzk1IDAuMjYzOTMtMS4wMzggMC4yNzI4OS0wLjQwMTUyIDAuMDE3MTItMC44MDE3My0wLjE1OTY2LTEuMjAxMi0wLjUzMTEyLTAuMjU0OTctMC4yMjIzOC0wLjU3Mzg4LTAuNjAzNjItMC45NTU5My0xLjE0MzctMC40MDk5LTAuNTc2NzQtMC43NDY5MS0xLjI0NTUtMS4wMTA5LTIuMDA4LTAuMjgyNzUtMC44MjM1Ni0wLjQyNDQ5LTEuNjIxMS0wLjQyNDQ5LTIuMzkzMSAwLTAuODg0NDEgMC4xOTExLTEuNjQ3MiAwLjU3Mzg4LTIuMjg2NCAwLjMwMDgzLTAuNTEzNDQgMC43MDEwNC0wLjkxODQ2IDEuMjAxOS0xLjIxNTggMC41MDA5LTAuMjk3MzMgMS4wNDIxLTAuNDQ4ODQgMS42MjUtMC40NTg1NCAwLjMxODkxIDAgMC43MzcxMyAwLjA5ODY1IDEuMjU2OCAwLjI5MjUyIDAuNTE4MjUgMC4xOTQ1MyAwLjg1MTAxIDAuMjkzMTggMC45OTY5IDAuMjkzMTggMC4xMDkwOCAwIDAuNDc4NzQtMC4xMTUzNSAxLjEwNTQtMC4zNDUzMSAwLjU5MjYyLTAuMjEzMjYgMS4wOTI4LTAuMzAxNTYgMS41MDI1LTAuMjY2NzggMS4xMTAzIDAuMDg5NiAxLjk0NDQgMC41MjcyOSAyLjQ5OTIgMS4zMTU4LTAuOTkyOTkgMC42MDE2Ni0xLjQ4NDIgMS40NDQ0LTEuNDc0NCAyLjUyNTQgOWUtMyAwLjg0MjA1IDAuMzE0NDMgMS41NDI4IDAuOTE0NzkgMi4wOTkxIDAuMjcyMDggMC4yNTgyMiAwLjU3NTkyIDAuNDU3OCAwLjkxMzk4IDAuNTk5NTQtMC4wNzMzMiAwLjIxMjYxLTAuMTUwNyAwLjQxNjI2LTAuMjMyOTggMC42MTE3NnptLTIuNTQ2NC0xMC4wMmMwIDAuNjYtMC4yNDExMiAxLjI3NjItMC43MjE3MyAxLjg0NjYtMC41OCAwLjY3ODA3LTEuMjgxNSAxLjA2OTktMi4wNDIzIDEuMDA4MS0wLjAwOTctMC4wNzkxOC0wLjAxNTMtMC4xNjI1MS0wLjAxNTMtMC4yNTAwOCAwLTAuNjMzNiAwLjI3NTgyLTEuMzExNyAwLjc2NTY0LTEuODY2MSAwLjI0NDU0LTAuMjgwNzEgMC41NTU1NS0wLjUxNDEyIDAuOTMyNzEtMC43MDAzMSAwLjM3NjM1LTAuMTgzNDEgMC43MzIzMy0wLjI4NDg1IDEuMDY3MS0wLjMwMjIxIDAuMDA5OCAwLjA4ODIzIDAuMDEzODUgMC4xNzY0NyAwLjAxMzg1IDAuMjY0eiIgc3Ryb2tlLXdpZHRoPSIuMDgxNDYiLz48L3N2Zz4%3D

[consolas]: https://docs.microsoft.com/en-us/typography/font-list/consolas

[input-mono]: http://input.djr.com/download/

[pragmatapro]: https://www.fsd.it/shop/fonts/pragmatapro/

[operator]: https://www.typography.com/fonts/operator/

[dank]: https://dank.sh/

[release]: https://github.com/ryanoasis/nerd-fonts/releases/latest "Latest Release (external link) ➶"

[coc]: https://github.com/ryanoasis/nerd-fonts/blob/-/code_of_conduct.md "Contributor Covenant Code of Conduct"

[prs]: http://makeapullrequest.com "Make a Pull Request (external link) ➶"

<!--
Font repos
-->

[f-arimo]: https://github.com/google/fonts/tree/master/apache/arimo

[f-hack]: https://github.com/chrissimpkins/Hack

[f-a-pro]: https://www.marksimonson.com/fonts/view/anonymous-pro

[f-3270]: https://github.com/rbanffy/3270font

[f-cascadia]: https://github.com/microsoft/cascadia-code

[f-cousine]: https://fonts.google.com/specimen/Cousine

[f-source]: https://github.com/adobe-fonts/source-code-pro

[f-liberation]: https://pagure.io/liberation-fonts

[f-lilex]: https://github.com/mishamyrt/Lilex

[f-terminus]: http://terminus-font.sourceforge.net

[f-fira-mono]: https://github.com/mozilla/Fira

[f-fira-code]: https://github.com/tonsky/FiraCode

[f-monoid]: https://github.com/larsenwork/monoid

[f-iosevka]: https://github.com/be5invis/Iosevka

[f-jetbrains-mono]: https://github.com/JetBrains/JetBrainsMono

[f-fant]: https://github.com/belluzj/fantasque-sans

[f-share]: https://fonts.google.com/specimen/Share+Tech+Mono

[f-space]: https://fonts.google.com/specimen/Space+Mono

[f-go-mono]: https://go.googlesource.com/image/+/master/font/gofont/ttfs/

[f-gohu]: http://font.gohu.org/

[f-gohu2]: https://github.com/koemaeda/gohufont-ttf

[f-mononoki]: https://madmalik.github.io/mononoki/

[f-hasklig]: https://github.com/i-tu/Hasklig

[f-ibm-plex]: https://github.com/IBM/plex

[f-victor]: https://github.com/rubjo/victor-mono

[f-daddytimemono]: https://github.com/BourgeoisBear/DaddyTimeMono

[f-agave]: https://github.com/agarick/agave

[f-ia-writer]: https://github.com/iaolo/iA-Fonts

[f-departuremono]:https://github.com/rektdeckard/departure-mono

<!--
Patched Font internal links
-->

[p-3270]: patched-fonts/3270

[p-anonymous-pro]: patched-fonts/AnonymousPro

[p-aurulent]: patched-fonts/AurulentSansMono

[p-arimo]: patched-fonts/Arimo

[p-bigblueterm]: patched-fonts/BigBlueTerminal

[p-bitstream]: patched-fonts/BitstreamVeraSansMono

[p-blex]: patched-fonts/IBMPlexMono

[p-cascadia]: patched-fonts/CascadiaCode

[p-cousine]: patched-fonts/Cousine

[p-departuremono]:patched-fonts/DepartureMono

[p-dejavu]: patched-fonts/DejaVuSansMono

[p-droid]: patched-fonts/DroidSansMono

[p-fantasque]: patched-fonts/FantasqueSansMono

[p-fira-code]: patched-fonts/FiraCode

[p-fira-mono]: patched-fonts/FiraMono

[p-heavy-data]: patched-fonts/HeavyData

[p-hermit]: patched-fonts/Hermit

[p-inconsolata]: patched-fonts/Inconsolata

[p-inconsolata-go]: patched-fonts/InconsolataGo

[p-inconsolata-lgc]: patched-fonts/InconsolataLGC

[p-iosevka]: patched-fonts/Iosevka

[p-jetbrains-mono]: patched-fonts/JetBrainsMono

[p-hack]: patched-fonts/Hack

[p-lekton]: patched-fonts/Lekton

[p-liberation]: patched-fonts/LiberationMono

[p-lilex]: patched-fonts/Lilex

[p-meslo]: patched-fonts/Meslo

[p-monofur]: patched-fonts/Monofur

[p-monoid]: patched-fonts/Monoid

[p-mplus]: patched-fonts/MPlus

[p-noto]: patched-fonts/Noto

[p-opendyslexic]: patched-fonts/OpenDyslexic

[p-overpass]: patched-fonts/Overpass

[p-profont]: patched-fonts/ProFont

[p-proggy-clean]: patched-fonts/ProggyClean

[p-roboto]: patched-fonts/RobotoMono

[p-source-code-pro]: patched-fonts/SourceCodePro

[p-terminus]: patched-fonts/Terminus

[p-tinos]: patched-fonts/Tinos

[p-ubuntu]: patched-fonts/Ubuntu

[p-ubuntu-mono]: patched-fonts/UbuntuMono

[p-share-tech-mono]: patched-fonts/ShareTechMono

[p-space-mono]: patched-fonts/SpaceMono

[p-go-mono]: patched-fonts/Go-Mono

[p-gohu]: patched-fonts/Gohu

[p-mononoki]: patched-fonts/Mononoki

[p-code-nr]: patched-fonts/CodeNewRoman

[p-hasklig]: patched-fonts/Hasklig

[p-victor]: patched-fonts/VictorMono

[p-daddytimemono]: patched-fonts/DaddyTimeMono

[p-agave]: patched-fonts/Agave

[p-im-writing]: patched-fonts/iA-Writer

<!--
Quick Link Images
-->

[ql-1]: images/nerd-fonts-character-logo-md.png "Latest Release (external link) ➶"

[ql-2]: images/nerd-fonts-character-logo-md.png "↓ View Patched Fonts List ↓"

[ql-3]: images/nerd-fonts-patcher-logo-md.png "↓ Font Patcher Details ↓"

[ql-4]: https://raw.githubusercontent.com/wiki/ryanoasis/vim-devicons/screenshots/v1.0.0/branding-logo-sm.png "VimDevIcons Vim Plugin (external link) ➶"

[ql-5]: images/nerd-fonts-character-logo-md.png "Font Package Archive (Zip) Downloads (external link) ➶"

<!--
Patched Font Statuses
-->

[w-top]: https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/windows-pass-sm.png "↓ Windows Compatibility Status ↓"

[l-top]: https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/linux-pass-sm.png "↓ Linux Compatibility Status ↓"

[m-top]: https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/mac-pass-sm.png "↓ macOS (OSX) Compatibility Status ↓"

[w]: https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/windows-pass-sm.png "Windows status is working ☺"

[l]: https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/linux-pass-sm.png "Linux status is working ☺"

[m]: https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/mac-pass-sm.png "macOS (OSX) status is working ☺"

[w2]: https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/windows-unknown-sm.png "Windows status is Unknown/Un-tested"

[l2]: https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/linux-unknown-sm.png "Linux status is Unknown/Un-tested"

[m2]: https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/mac-unknown-sm.png "macOS (OSX) status is Unknown/Un-tested"

[s-iosevka]: https://github.com/ryanoasis/nerd-fonts/issues/83
