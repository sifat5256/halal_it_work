import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Function to show Add Note Bottom Sheet
void showAddNoteBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) => AddNoteBottomSheet(),
  );
}

/// **Add Note Bottom Sheet**
class AddNoteBottomSheet extends StatelessWidget {
  final TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFCD434), // Yellow Background
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Header Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Add Note", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
              GestureDetector(
                onTap: () => Get.back(),
                child: Text("Cancel", style: TextStyle(fontSize: 16, color: Colors.black)),
              ),
            ],
          ),
          SizedBox(height: 42),

          /// Input Field
          TextField(
            controller: noteController,
            maxLength: 100,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: "Please input your note",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          SizedBox(height: 12),

          /// Continue Button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                String note = noteController.text;
                Get.back(); // Close Add Note Sheet
                showConfirmPaymentBottomSheet(context, note); // Open Confirm Payment Sheet
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text("Continue", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

/// Function to show Confirm Payment Bottom Sheet
void showConfirmPaymentBottomSheet(BuildContext context, String note) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) => ConfirmPaymentBottomSheet(note: note),
  );
}

/// **Confirm Payment Bottom Sheet**
class ConfirmPaymentBottomSheet extends StatelessWidget {
  final String note;

  ConfirmPaymentBottomSheet({required this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFCD434), /// Yellow Background
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Header Section

          Row(
           // crossAxisAlignment: CrossAxisAlignment.,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Confirm Payment", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
              GestureDetector(
              onTap: () => Get.back(),
              child: Text("Cancel", style: TextStyle(fontSize: 16, color: Colors.black)),
            ),

            ],
          ),
          SizedBox(height: 30),
       Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text("Send To", style: TextStyle(fontSize: 18,  color: Colors.black,fontWeight: FontWeight.w500)),


           /// Recipient Information
           ListTile(
             leading: CircleAvatar(
               backgroundColor: Colors.grey,
               child: Icon(Icons.person, color: Colors.white),
             ),
             title: Text("724495911 (Halal ID)", style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF1E1700))),
             subtitle: Text("Nickname: Md Antor_ali",style: TextStyle(
               color: Color(0xFF494741)
             ),),
           ),
           SizedBox(height: 12),

           /// Amount Section
           Text("Amount", style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
           SizedBox(
             height: 15,
           ),
           Material(
             elevation: 2,
             child: Container(
             //  height: MediaQuery.of(context).size.height*0.15,
               width: double.infinity,
               padding: EdgeInsets.all(12),
               decoration: BoxDecoration(
                 border: Border.all(
                   color: Colors.black
                 ),
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(8),
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("Pay Receives", style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17,color: Color(0xFF494741))),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.end,
                     children: [
                       Text("500 BDT", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color(0xFF3D414B))),
                       Text("≈ 0.001 gm Gold", style: TextStyle(fontWeight: FontWeight.normal,color: Color(0xFF65625A))),
                     ],
                   )
                 ],
               ),
             ),
           ),


           SizedBox(height: 42),

           /// Payment Method Section
           Text("Pay With", style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
           SizedBox(
             height: 15,
           ),
           Material(
             elevation: 2,
             child: Container(
               //  height: MediaQuery.of(context).size.height*0.15,
               width: double.infinity,
               padding: EdgeInsets.all(12),
               decoration: BoxDecoration(
                 border: Border.all(
                   color: Colors.black
                 ),
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(8),
               ),
               child: Column(

                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,

                     children: [
                       Text("Wallet : ", style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17,color: Color(0xFF494741))),
                       Text("Funding Wallet", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Color(0xFF494741))),
                     ],
                   ),
                   SizedBox(
                     height: 15,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Currency:", style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17,color: Color(0xFF494741))),
                       Text("1 BDT", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,color: Color(0xFF494741))),
                     ],
                   )
                 ],
               ),
             ),
           ),


           SizedBox(height: 90),

           /// Continue Button
           SizedBox(
             width: double.infinity,
             height: 50,
             child: ElevatedButton(
               onPressed: () {
                 Get.back();
                 print("Payment Confirmed");
               },
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.white,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
               ),
               child: Text("Continue", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
             ),
           ),
         ],
       )
        ],
      ),
    );
  }


}
