import data.int.basic

namespace Zmodn

-- variable {n : ℕ}

/- a mod n: a + k*n  -/
structure Zmodn : Type :=
(Z : ℤ)
(k : ℤ)

def zero : Zmodn := ⟨0, 0⟩
def one  : Zmodn := ⟨1, 0⟩

/- a + k₁*n + b + k₂*n = (a + b) + (k₁ + k₂)*n -/
def add (a b : Zmodn) : Zmodn :=
{
  Z := a.Z + b.Z,
  k := a.k + b.k,
}
notation a ` +ₘ ` b := add a b

/- (a + k₁*n) * (b + k₂*n) = a*b + (a*k₂ + b*k₁ + k₁*k₂*n)*n -/
def mul (a b : Zmodn) : Zmodn :=
{
  Z := a.Z * b.Z,
  k := a.Z * b.k + b.Z * a.k + a.k * b.k * 5,
}
notation a ` *ₘ ` b := mul a b

def equals (a b : Zmodn) :=
a.Z = b.Z
notation a ` =ₘ ` b := equals a b

lemma reflexive_equals :
∀ a, a =ₘ a :=
by {intro, simp [equals]}

lemma symmetric_equals :
∀ a b, (a =ₘ b) → (b =ₘ a) :=
by {intros a b h, rw equals at *, rw h.symm}

lemma transitive_equals :
∀ a b c, (a =ₘ b) → (b =ₘ c) → (a =ₘ c) :=
by {intros a b c h1 h2, simp [equals, eq.trans h1 h2]}

lemma add_zero :
∀ a, a +ₘ zero =ₘ a :=
by simp [add, zero, equals, int.add_zero]

lemma mul_one :
∀ a, a *ₘ one =ₘ a :=
by simp [mul, one, equals, int.mul_one]

lemma add_comm :
∀ (a b : Zmodn),
(a +ₘ b) =ₘ (b +ₘ a) :=
by {intros, simp [add, equals, int.add_comm]}

lemma mul_comm :
∀ (a b : Zmodn),
(a *ₘ b) =ₘ (b *ₘ a) :=
by {intros, simp [mul, equals, int.mul_comm]}

lemma add_assoc :
∀ (a b c : Zmodn),
((a +ₘ b) +ₘ c) =ₘ (a +ₘ (b +ₘ c)) :=
by {intros, simp [add, equals, int.add_assoc]}

lemma mul_assoc :
∀ (a b c : Zmodn),
((a *ₘ b) *ₘ c) =ₘ (a *ₘ (b *ₘ c)) :=
by {intros, simp [mul, equals, int.mul_assoc]}

lemma distrib :
∀ (a b c : Zmodn),
(a *ₘ (b +ₘ c)) =ₘ ((a *ₘ b) +ₘ (a *ₘ c)) :=
by {intros, simp [add, mul, equals, int.distrib_left]}

lemma add_inv :
∀ a, ∃ b,
a +ₘ b =ₘ zero :=
by {intro, use ⟨-a.Z, a.k⟩, simp [add, zero, equals]}

end Zmodn