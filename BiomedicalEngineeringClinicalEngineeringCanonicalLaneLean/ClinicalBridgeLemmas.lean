import BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean.ClinicalAdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean

def bridgeClosed (A : ClinicalAdmissibleClass) : Prop :=
  clinicalBridgeClosed A.object

theorem bridge_from_admissible_class (A : ClinicalAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : ClinicalAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : ClinicalAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean
end HautevilleHouse