import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean

structure MassTransferPackage where
  diffusionCoefficient : ℝ
  filmThickness : ℝ
  concentration : ℝ
  massTransferCoefficient : ℝ
  concentrationGradient : ℝ
  flux : ℝ

structure MassTransferEvidence (M : MassTransferPackage) where
  diffusionCoefficientClosed : M.diffusionCoefficient > 0
  filmThicknessClosed : M.filmThickness > 0
  concentrationClosed : M.concentration ≥ 0
  massTransferCoefficientClosed : M.massTransferCoefficient > 0
  concentrationGradientClosed : M.concentrationGradient ≠ 0
  fluxClosed : M.flux ≥ 0

def MassTransferClosed (M : MassTransferPackage) : Prop :=
  M.diffusionCoefficient > 0 ∧ M.filmThickness > 0 ∧
  M.concentration ≥ 0 ∧ M.massTransferCoefficient > 0 ∧
  M.concentrationGradient ≠ 0 ∧ M.flux ≥ 0

theorem mass_transfer_closed_from_evidence
    (M : MassTransferPackage) (E : MassTransferEvidence M) :
    MassTransferClosed M := by
  exact And.intro E.diffusionCoefficientClosed
    (And.intro E.filmThicknessClosed
      (And.intro E.concentrationClosed
        (And.intro E.massTransferCoefficientClosed
          (And.intro E.concentrationGradientClosed E.fluxClosed))))

end ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean
end HautevilleHouse