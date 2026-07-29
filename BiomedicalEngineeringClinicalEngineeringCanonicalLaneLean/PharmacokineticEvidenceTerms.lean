import BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean.CompartmentModelEvidence

namespace HautevilleHouse
namespace BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean

structure PharmacokineticEvidenceTerms {C : CompartmentModelPackage} where
  aucCalculated : Prop
  cmaxCalculated : Prop
  halfLifeDerived : Prop
  clearanceComputed : Prop

def PharmacokineticClosed {C : CompartmentModelPackage} (P : PharmacokineticEvidenceTerms C) : Prop :=
  P.aucCalculated ∧ P.cmaxCalculated ∧ P.halfLifeDerived ∧ P.clearanceComputed

theorem pharmacokinetic_closed_from_evidence {C : CompartmentModelPackage}
    (P : PharmacokineticEvidenceTerms C) (E : P.aucCalculated ∧ P.cmaxCalculated ∧ P.halfLifeDerived ∧ P.clearanceComputed) :
    PharmacokineticClosed P := by
  exact E

end BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean
end HautevilleHouse