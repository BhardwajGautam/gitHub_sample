class CommitModal {
  
  String id;
  

  CommitModal(
    
    this.id,
  );

  CommitModal.fromJson(Map<String, dynamic> json)
      : 
        id = json['sha'];

}