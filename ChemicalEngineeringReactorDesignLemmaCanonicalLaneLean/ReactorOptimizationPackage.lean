import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean

structure ReactorOptimizationPackage (C : CSTRDesignPackage) (P : PFRDesignPackage) (H : HeatTransferPackage) where
  objectiveFunction : Prop
  constraints : Prop
  designVariables : Prop
  optimalConversion : Prop
  optimalTemperature : Prop
  optimalReactorVolume : Prop
  costMinimization : Prop
  sensitivityAnalysis : Prop

structure ReactorOptimizationEvidence {C : CSTRDesignPackage} {P : PFRDesignPackage} {H : HeatTransferPackage}
    (O : ReactorOptimizationPackage C P H) where
  objectiveFunctionClosed : O.objectiveFunction
  constraintsClosed : O.constraints
  designVariablesClosed : O.designVariables
  optimalConversionClosed : O.optimalConversion
  optimalTemperatureClosed : O.optimalTemperature
  optimalReactorVolumeClosed : O.optimalReactorVolume
  costMinimizationClosed : O.costMinimization
  sensitivityAnalysisClosed : O.sensitivityAnalysis

def ReactorOptimizationPackageClosed {C : CSTRDesignPackage} {P : PFRDesignPackage} {H : HeatTransferPackage}
    (O : ReactorOptimizationPackage C P H) : Prop :=
  O.objectiveFunction ∧ O.constraints ∧ O.designVariables ∧
  O.optimalConversion ∧ O.optimalTemperature ∧ O.optimalReactorVolume ∧
  O.costMinimization ∧ O.sensitivityAnalysis

theorem reactor_optimization_package_closed_from_evidence {C : CSTRDesignPackage} {P : PFRDesignPackage} {H : HeatTransferPackage}
    (O : ReactorOptimizationPackage C P H) (E : ReactorOptimizationEvidence O) :
    ReactorOptimizationPackageClosed O := by
  exact And.intro E.objectiveFunctionClosed
    (And.intro E.constraintsClosed
      (And.intro E.designVariablesClosed
        (And.intro E.optimalConversionClosed
          (And.intro E.optimalTemperatureClosed
            (And.intro E.optimalReactorVolumeClosed
              (And.intro E.costMinimizationClosed E.sensitivityAnalysisClosed))))))

end ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean
end HautevilleHouse
