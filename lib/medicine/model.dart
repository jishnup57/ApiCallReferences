class Medicine {
  List<Problem> problem;
  Medicine({required this.problem});
  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
        problem: List<Problem>.from(
            json["problems"].map((x) => Problem.fromJson(x))),
      );
}

class Problem {
    Problem({
       required this.diabetes,
       required this.asthma,
    });

    List<Diabetes> diabetes;
    List<Asthma> asthma;

    factory Problem.fromJson(Map<String, dynamic> json) => Problem(
        diabetes: List<Diabetes>.from(json["Diabetes"].map((x) => Diabetes.fromJson(x))),
        asthma: List<Asthma>.from(json["Asthma"].map((x) => Asthma.fromJson(x))),
    );

   
}
class Diabetes {
    Diabetes({
       required this.medications,
       required this.labs,
    });

    List<Medication> medications;
    List<Lab> labs;

    factory Diabetes.fromJson(Map<String, dynamic> json) => Diabetes(
        medications: List<Medication>.from(json["medications"].map((x) => Medication.fromJson(x))),
        labs: List<Lab>.from(json["labs"].map((x) => Lab.fromJson(x))),
    );

}

class Asthma {
    Asthma();

    factory Asthma.fromJson(Map<String, dynamic> json) => Asthma(
    );

   
}

class Medication {
    Medication({
       required this.medicationsClasses,
    });

    List<MedicationsClass> medicationsClasses;

    factory Medication.fromJson(Map<String, dynamic> json) => Medication(
        medicationsClasses: List<MedicationsClass>.from(json["medicationsClasses"].map((x) => MedicationsClass.fromJson(x))),
    );

 
}




class MedicationsClass {
    MedicationsClass({
      required  this.className,
   
    });

    List<ClassName> className;
  

    factory MedicationsClass.fromJson(Map<String, dynamic> json) => MedicationsClass(
        className: List<ClassName>.from(json["className"].map((x) => ClassName.fromJson(x))),

    );

 
}




class ClassName {
  List<AssociatedDrug> associatedDrug;
  List<AssociatedDrug> associatedDrug2;
  ClassName({
    required this.associatedDrug,
    required this.associatedDrug2,
  });
  factory ClassName.fromJson(Map<String, dynamic> json) => ClassName(
        associatedDrug: List<AssociatedDrug>.from(json["associatedDrug"].map((x)=>AssociatedDrug.fromJson(x))),
        associatedDrug2: List<AssociatedDrug>.from(json["associatedDrug#2"].map((x) => AssociatedDrug.fromJson(x))),
      );
}

class AssociatedDrug {
  String name;
  String? dose;
  String strenth;
  AssociatedDrug({this.dose, required this.name, required this.strenth});
  factory AssociatedDrug.fromJson(Map<String, dynamic> json) => AssociatedDrug(
        name: json['name'],
        strenth: json['strength'],
        dose: json['dose'],
      );
}


class Lab {
    Lab({
     required this.missingField,
    });

    String missingField;

    factory Lab.fromJson(Map<String, dynamic> json) => Lab(
        missingField: json["missing_field"],
    );

    Map<String, dynamic> toJson() => {
        "missing_field": missingField,
    };
}