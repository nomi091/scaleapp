import 'package:flutter/material.dart';
import 'package:scaleapp/utils/constants/colors.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 14,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColor().appIconcolor,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColor().textcolor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  "Your privacy is important to us. It is Brobdingnagian Entertainment Groupe's policy to respect your privacy regarding any information we may collect from you across our website, http://www.brobdingnagianentgroup.com, and other sites we own and operate.\n\n"
                  "We only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent. We also let you know why we’re collecting it and how it will be used.\n\n"
                  "We only retain collected information for as long as necessary to provide you with your requested service. What data we store, we’ll protect within commercially acceptable means to prevent loss and theft, as well as unauthorized access, disclosure, copying, use or modification.\n\n"
                  "We don’t share any personally identifying information publicly or with third-parties, except when required to by law.\n\n"
                  "Our website may link to external sites that are not operated by us. Please be aware that we have no control over the content and practices of these sites, and cannot accept responsibility or liability for their respective privacy policies.\n\n"
                  "You are free to refuse our request for your personal information, with the understanding that we may be unable to provide you with some of your desired services.\n\n"
                  "Your continued use of our website will be regarded as an acceptance of our practices around privacy and personal information. If you have any questions about how we handle user data and personal information, feel free to contact us.\n\n"
                  "This policy is effective as of 18 May 2020 and henceforward.",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor().textcolor,
                    height: 1.5,
                  ),
                ),

                ///
                const SizedBox(
                  height: 28,
                ),
                Text(
                  "END USER LOCATION PERMISSION",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColor().textcolor,
                    height: 1.5,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Scale app uses your location to allow other users to determine how far apart the other users are from their device.  Scale app also uses location to allow subscribers and non subscribers to use our search feature up to unlimited and limited miles. The use of locations allows for a better experience as distance largely affects who people decide to get to know and ultimately date. Each user that views your profile will be able to see, in miles, how far away from them you are at any given moment. Location tracks your phone device and uses it as the reference point to determine your distance from each other user on the app.',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor().textcolor,
                    height: 1.5,
                  ),
                ),

                ///
                const SizedBox(
                  height: 28,
                ),
                Text(
                  "END USER LICENSE AGREEMENT",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColor().textcolor,
                    height: 1.5,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'This copy of SCALE app ("the Software Product") and accompanying documentation is licensed and not sold. This Software Product is protected by copyright laws and treaties, as well as laws and treaties related to other forms of intellectual property. Signing Party or its subsidiaries, affiliates, and suppliers (collectively "The Signing Party") own intellectual property rights in the Software Product. The Licensee"s ("you" or "your") license to download, use, copy, or change the Software Product is subject to these rights and to all the terms and conditions of this End User License Agreement ("Agreement").\n\n'
                  "Acceptance\n\n"
                  'YOU ACCEPT AND AGREE TO BE BOUND BY THE TERMS OF THIS AGREEMENT BY SELECTING THE "ACCEPT" OPTION AND DOWNLOADING THE SOFTWARE PRODUCT OR BY INSTALLING, USING, OR COPYING THE SOFTWARE PRODUCT. YOU MUST AGREE TO ALL OF THE TERMS OF THIS AGREEMENT BEFORE YOU WILL BE ALLOWED TO DOWNLOAD THE SOFTWARE PRODUCT. IF YOU DO NOT AGREE TO ALL OF THE TERMS OF THIS AGREEMENT, YOU MUST SELECT "DECLINE" AND YOU MUST NOT INSTALL, USE, OR COPY THE SOFTWARE PRODUCT.\n\n'
                  '***I agree to allow other users of the app to rank my profile and me on my physical attractiveness as they see it using the scale 1-10 as provided.***\n\n'
                  "License Grant\n\n"
                  "This Agreement entitles you to install and use one copy of the Software Product. In addition, you may make one archival copy of the Software Product. The archival copy must be on a storage medium other than a hard drive, and may only be used for the reinstallation of the Software Product. This Agreement does not permit the installation or use of multiple copies of the Software Product, or the installation of the Software Product on more than one computer at any given time, on a system that allows shared used of applications, on a multi-user network, or on any configuration or system of computers that allows multiple users. Multiple copy use or installation is only allowed if you obtain an appropriate licensing agreement for each user and each copy of the Software Product.\n\n"
                  "Restrictions on Transfer\n\n"
                  "Without first obtaining the express written consent of The Signing Party, you may not assign your rights and obligations under this Agreement, or redistribute, encumber, sell, rent, lease, sublicense or otherwise transfer your rights to the Software Product.\n\n"
                  "Restrictions on Use\n\n"
                  "You may not use, copy, or install the Software Product on any system with more than one computer, or permit the use, copying, or installation of the Software Product by more than one user or on more than one computer. If you hold multiple, validly licensed copies, you may not use, copy, or install the Software Product on any system with more than the number of computers permitted by license, or permit the use, copying, or installation by more users, or on more computers than the number permitted by license.\n\n"
                  'You may not decompile, "reverse-engineer", disassemble, or otherwise attempt to derive the source code for the Software Product.\n\n'
                  'You may not use the database portion of the Software Product in connection with any software other than the Software Product.\n\n'
                  "Restrictions on Alteration\n\n"
                  "You may not modify the Software Product or create any derivative work of the Software Product or its accompanying documentation. Derivative works include but are not limited to translations. You may not alter any files or libraries in any portion of the Software Product. You may not reproduce the database portion or create any tables or reports relating to the database portion.\n\n"
                  "Restrictions on Copying\n\n"
                  "You may not copy any part of the Software Product except to the extent that licensed use inherently demands the creation of a temporary copy stored in computer memory and not permanently affixed on storage medium. You may make one archival copy which must be stored on a medium other than a computer hard drive.\n\n"
                  "Limited Software Product Warranty\n\n"
                  "For a period of 10 days from the date of shipment or from the date that you download the Software Product, as applicable, The Signing Party warrants that when properly installed and used under normal conditions, the Software Product will perform substantially as advertised.\n\n"
                  "Disclaimer of Warranties and Limitation of Liability\n\n"
                  "UNLESS OTHERWISE EXPLICITLY AGREED TO IN WRITING BY THE SIGNING PARTY, THE SIGNING PARTY MAKES NO OTHER WARRANTIES, EXPRESS OR IMPLIED, IN FACT OR IN LAW, INCLUDING, BUT NOT LIMITED TO, ANY IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE OTHER THAN AS SET FORTH IN THIS AGREEMENT OR IN THE LIMITED WARRANTY DOCUMENTS PROVIDED WITH THE SOFTWARE PRODUCT.\n\n"
                  "The Signing Party makes no warranty that the Software Product will meet your requirements or operate under your specific conditions of use. The Signing Party makes no warranty that operation of the Software Product will be secure, error-free, or free from interruption. YOU MUST DETERMINE WHETHER THE SOFTWARE PRODUCT SUFFICIENTLY MEETS YOUR REQUIREMENTS FOR SECURITY AND UNINTERRUPTABILITY. YOU BEAR SOLE RESPONSIBILITY AND ALL LIABILITY FOR ANY LOSS INCURRED DUE TO FAILURE OF THE SOFTWARE PRODUCT TO MEET YOUR REQUIREMENTS. THE SIGNING PARTY WILL NOT, UNDER ANY CIRCUMSTANCES, BE RESPONSIBLE OR LIABLE FOR THE LOSS OF DATA ON ANY COMPUTER OR INFORMATION STORAGE DEVICE.\n\n"
                  "UNDER NO CIRCUMSTANCES SHALL THE SIGNING PARTY, ITS DIRECTORS, OFFICERS, EMPLOYEES OR AGENTS BE LIABLE TO YOU OR ANY OTHER PARTY FOR INDIRECT, CONSEQUENTIAL, SPECIAL, INCIDENTAL, PUNITIVE, OR EXEMPLARY DAMAGES OF ANY KIND (INCLUDING LOST REVENUES OR PROFITS OR LOSS OF BUSINESS) RESULTING FROM THIS AGREEMENT, OR FROM THE FURNISHING, PERFORMANCE, INSTALLATION, OR USE OF THE SOFTWARE PRODUCT, WHETHER DUE TO A BREACH OF CONTRACT, BREACH OF WARRANTY, OR THE NEGLIGENCE OF THE SIGNING PARTY OR ANY OTHER PARTY, EVEN IF THE SIGNING PARTY IS ADVISED BEFOREHAND OF THE POSSIBILITY OF SUCH DAMAGES. TO THE EXTENT THAT THE APPLICABLE JURISDICTION LIMITS THE SIGNING PARTY'S ABILITY TO DISCLAIM ANY IMPLIED WARRANTIES, THIS DISCLAIMER SHALL BE EFFECTIVE TO THE MAXIMUM EXTENT PERMITTED.\n\n"
                  "Limitation of Remedies and Damages\n\n"
                  "Your remedy for a breach of this Agreement or of any warranty included in this Agreement is the correction or replacement of the Software Product. The selection of whether to correct or replace shall be solely at the discretion of The Signing Party. The Signing Party reserves the right to substitute a functionally equivalent copy of the Software Product as a replacement. If The Signing Party is unable to provide a replacement or substitute Software Product or corrections to the Software Product, your sole alternate remedy shall be a refund of the purchase price for the Software Product exclusive of any costs for shipping and handling.\n\n"
                  "Any claim must be made within the applicable warranty period. All warranties cover only defects arising under normal use and do not include malfunctions or failure resulting from misuse, abuse, neglect, alteration, problems with electrical power, acts of nature, unusual temperatures or humidity, improper installation, or damage determined by The Signing Party to have been caused by you. All limited warranties on the Software Product are granted only to you and are non-transferable. You agree to indemnify and hold The Signing Party harmless from all claims, judgments, liabilities, expenses, or costs arising from your breach of this Agreement and/or acts or omissions.\n\n"
                  "Governing Law, Jurisdiction and Costs\n\n"
                  "This Agreement is governed by the laws of North Carolina, without regard to North Carolina's conflict or choice of law provisions.\n\n"
                  "Severability\n\n"
                  "If any provision of this Agreement shall be held to be invalid or unenforceable, the remainder of this Agreement shall remain in full force and effect. To the extent any express or implied restrictions are not permitted by applicable laws, these express or implied restrictions shall remain in force and effect to the maximum extent permitted by such applicable laws.",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor().textcolor,
                    height: 1.5,
                  ),
                ),
                const SizedBox(
                  height: 39,
                ),
                Text(
                  "NO SEXUAL CONTENT ALLOWED",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColor().textcolor,
                    height: 1.5,
                  ),
                ),
                const SizedBox(
                  height: 27,
                ),
                Text(
                  "Sexual Content and Profanity\n\n"
                  "We EXPLICITLY don't allow content, photos, videos or language that contain or promote sexual content or profanity, including pornography, or any content or services intended to be sexually gratifying. Content that contains nudity is NOT allowed even in educational, documentary, scientific or artistic expression, and is not gratuitous.",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColor().textcolor,
                    height: 1.5,
                  ),
                ),
                const SizedBox(
                  height: 27,
                ),
                Text(
                  "Examples of violations\n\n"
                  "Depictions of sexual nudity, or sexually suggestive poses in which the subject is nude, blurred or minimally clothed, and/or where the clothing would not be acceptable in an appropriate public context.\n\n\n"
                  "Content that is lewd or profane - including but not limited to content which may contain profanity, slurs, explicit text, adult/sexual keywords in the store listing or in-app.\n\n\n\n"
                  "Content that depicts, describes, or encourages bestiality.\n\n\n\n"
                  "Content that promote sex-related entertainment, escort services, or other services that may be interpreted as providing sexual acts in exchange for compensation.\n\n\n\n"
                  "Any language that degrade or objectify people.\n\n\n\n"
                  "------------------------------\n\n\n"
                  "BULLYING AND HARRASMENT\n\n\n"
                  "We don't allow, facilitate or tolerate  threats, harassment, or bullying.\n\n\n",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColor().textcolor,
                    height: 1.5,
                  ),
                ),
                Text(
                  "Any violations to any of the above policies will immediately facilitate the termination of your account may be punishable to the highest extent of the law.\n"
                  "X",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColor().redcolor,
                    height: 1.5,
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
