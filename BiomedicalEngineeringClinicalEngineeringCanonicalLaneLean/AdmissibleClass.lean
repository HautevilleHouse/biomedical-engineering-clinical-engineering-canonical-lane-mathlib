import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean

structure AdmissibleClass where
  object : BiomedicalAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BiomedicalWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean
end HautevilleHouse