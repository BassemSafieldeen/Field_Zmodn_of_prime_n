import Zmodn
import prime

namespace Zmodn

lemma mul_inv_of_prime_n :
∀ (a : Zmodn) [a ≠ zero], ∃ b, a *ₘ b =ₘ one :=
begin
  intros a ha,
  sorry,
end

end Zmodn

/-
lemma different_remainders (a : Zmodn) :
∀ (c,d ∈ {0,..,n-1}) [c ≠ d],
c*a ≠ₘ d*a :=
begin
  intros c d hcd,
  by_contradiction H, -- assume c*a =ₘ d*a

  have A : n|a*(c-d), {
    sorry, -- 
  },
  have B : n|a*(c-d) → n|a ∨ n|(c-d),
  by rw prime

  have C : ¬ n|a ∧ ¬ n|(c-d) → ¬ n|a*(c-d),
  by negate_B

  have D : ¬ n∣a ∧ ¬ n∣(c-d), {
    sorry,
    -- first part because n prime
    -- second part because 0 < |c-d| < p
  },
  have E : ¬ n|a*(c-d),
  by exact C D

  -- E contradicts A
end

lemma different_remainders_minus_one (a : Zmodn) :
∀ (c,d ∈ {0,..,n-1}) [c ≠ d],
c*a - 1 ≠ₘ d*a - 1 :=
by simp [different_remainders]

lemma n_different_possible_remainders :
... := sorry

lemma so_one_of_the_remainders_zero :
∀ a, ∃ b ∈ {0,..,n-1},
b*a - 1 =ₘ 0 := sorry

theorem exists_mul_inv :
∀ a, ∃ b ∈ {0,..,n-1},
b*a =ₘ 1 :=
by simp [so_one_of_the_remainders_zero]

-- all the elements are different from each other
-- each element ≠ each other element
-/

/-
the n elements can take values from zero to p-1

if each element ≠ each other element
and each element can take values zero to p-1
then one of them is zero
-/

/-
References

SE answer:
https://math.stackexchange.com/questions/1975080/prove-existence-of-multiplicative-inverse-modulo-p-when-p-is-prime
-/