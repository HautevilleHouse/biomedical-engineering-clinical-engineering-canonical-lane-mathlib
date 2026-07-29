import BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BiomedicalWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean
end HautevilleHouse