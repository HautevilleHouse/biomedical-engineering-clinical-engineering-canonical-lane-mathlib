import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean

-- Admitted object for clinical engineering: a dataset with inference
structure ClinicalObject where
  patientData : SurvivalData
  diagnosticTest : DiagnosticTest
  compartmentModel : CompartmentModel 3  -- simple three-compartment model
  equation : PharmacokineticEquation 3
  endpointSatisfied : Prop
  remainderRecorded : Prop

structure ClinicalAdmissibleClass where
  object : ClinicalObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

end BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean
end HautevilleHouse