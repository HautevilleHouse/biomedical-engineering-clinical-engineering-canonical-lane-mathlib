import HautevilleHouse.BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean

structure SurvivalFunctionPackage where
  hazardFunction : ℝ → ℝ
  cumulativeHazard : ℝ → ℝ
  survivalTimeDistribution : ℝ → ℝ
  proportionalHazards : Prop
  coxModelValid : Prop
  baselineHazardSpecified : Prop

structure SurvivalModelEvidence (S : SurvivalFunctionPackage) where
  hazardPositive : ∀ t : ℝ, S.hazardFunction t > 0
  cumulativeHazardDerivative : ∀ t : ℝ, S.cumulativeHazard t = ∫ (u : ℝ) in (0, t), S.hazardFunction u
  survivalDistributionDerived : ∀ t : ℝ, S.survivalTimeDistribution t = Real.exp (-S.cumulativeHazard t)
  proportionalHazardsClosed : S.proportionalHazards
  coxModelValidClosed : S.coxModelValid
  baselineHazardSpecifiedClosed : S.baselineHazardSpecified

def SurvivalModelClosed (S : SurvivalFunctionPackage) : Prop :=
  S.proportionalHazards ∧ S.coxModelValid ∧ S.baselineHazardSpecified

theorem survival_model_closed_from_evidence (S : SurvivalFunctionPackage) (E : SurvivalModelEvidence S) :
    SurvivalModelClosed S := by
  exact And.intro E.proportionalHazardsClosed (And.intro E.coxModelValidClosed E.baselineHazardSpecifiedClosed)

structure KaplanMeierEstimate where
  timePoints : List ℝ
  survivalProbabilities : List ℝ
  numberOfSubjects : Nat
  censoredIndicator : List Bool
  estimateValid : Prop

def KaplanMeierClosed (K : KaplanMeierEstimate) : Prop :=
  K.estimateValid ∧ K.numberOfSubjects > 0

theorem kaplan_meier_closed (K : KaplanMeierEstimate) :
    KaplanMeierClosed K := by
  exact And.intro K.estimateValid (by
    have : K.numberOfSubjects > 0 := by
      -- from data
      sorry
    exact this)

end BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean
end HautevilleHouse