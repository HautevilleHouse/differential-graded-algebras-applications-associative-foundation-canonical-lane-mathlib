import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

structure MinimalModelPackage (D : DGAlgebraPackage) where
  minimalModelDefined : Prop
  quasiIsomorphismToOriginal : Prop
  uniquenessUpToIsomorphism : Prop
  formalityCriterion : Prop

structure MinimalModelEvidence (D : DGAlgebraPackage) (M : MinimalModelPackage D) where
  minimalModelDefinedClosed : M.minimalModelDefined
  quasiIsomorphismToOriginalClosed : M.quasiIsomorphismToOriginal
  uniquenessUpToIsomorphismClosed : M.uniquenessUpToIsomorphism
  formalityCriterionClosed : M.formalityCriterion

def MinimalModelClosed (D : DGAlgebraPackage) (M : MinimalModelPackage D) : Prop :=
  M.minimalModelDefined ∧ M.quasiIsomorphismToOriginal ∧
  M.uniquenessUpToIsomorphism ∧ M.formalityCriterion

theorem minimal_model_closed_from_evidence (D : DGAlgebraPackage) (M : MinimalModelPackage D)
    (E : MinimalModelEvidence D M) : MinimalModelClosed D M := by
  exact And.intro E.minimalModelDefinedClosed
    (And.intro E.quasiIsomorphismToOriginalClosed
      (And.intro E.uniquenessUpToIsomorphismClosed E.formalityCriterionClosed))

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse