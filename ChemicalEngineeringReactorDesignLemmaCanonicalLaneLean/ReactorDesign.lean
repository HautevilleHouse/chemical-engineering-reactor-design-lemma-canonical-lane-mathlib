import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean

structure ReactorDesignPackage where
  volume : ℝ
  flowRate : ℝ
  inletConcentration : ℝ
  outletConcentration : ℝ
  conversion : ℝ
  residenceTime : ℝ

structure ReactorDesignEvidence (R : ReactorDesignPackage) where
  volumeClosed : R.volume > 0
  flowRateClosed : R.flowRate > 0
  inletConcentrationClosed : R.inletConcentration ≥ 0
  outletConcentrationClosed : R.outletConcentration ≥ 0
  conversionClosed : R.conversion > 0 ∧ R.conversion < 1
  residenceTimeClosed : R.residenceTime > 0

def ReactorDesignClosed (R : ReactorDesignPackage) : Prop :=
  R.volume > 0 ∧ R.flowRate > 0 ∧
  R.inletConcentration ≥ 0 ∧ R.outletConcentration ≥ 0 ∧
  (R.conversion > 0 ∧ R.conversion < 1) ∧ R.residenceTime > 0

theorem reactor_design_closed_from_evidence
    (R : ReactorDesignPackage) (E : ReactorDesignEvidence R) :
    ReactorDesignClosed R := by
  exact And.intro E.volumeClosed
    (And.intro E.flowRateClosed
      (And.intro E.inletConcentrationClosed
        (And.intro E.outletConcentrationClosed
          (And.intro E.conversionClosed E.residenceTimeClosed))))

end ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean
end HautevilleHouse