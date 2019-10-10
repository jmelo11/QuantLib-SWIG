/*
 Copyright (C) 2004, 2005, 2006, 2007 StatPro Italia srl
 Copyright (C) 2009 Joseph Malicki
 Copyright (C) 2011 Lluis Pujol Bajador
 Copyright (C) 2014 Simon Mazzucca
 Copyright (C) 2016 Gouthaman Balaraman
 Copyright (C) 2017 BN Algorithms Ltd
 Copyright (C) 2018 Matthias Groncki
 Copyright (C) 2018 Matthias Lungwitz

 This file is part of QuantLib, a free-software/open-source library
 for financial quantitative analysts and developers - http://quantlib.org/

 QuantLib is free software: you can redistribute it and/or modify it
 under the terms of the QuantLib license.  You should have received a
 copy of the license along with this program; if not, please email
 <quantlib-dev@lists.sf.net>. The license is also available online at
 <http://quantlib.org/license.shtml>.

 This program is distributed in the hope that it will be useful, but WITHOUT
 ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 FOR A PARTICULAR PURPOSE.  See the license for more details.
*/

#ifndef quantlib_loans_i
#define quantlib_loans_i

%include bonds.i
%include instruments.i
%include calendars.i
%include daycounters.i
%include cashflows.i
%include interestrate.i
%include indexes.i
%include callability.i
%include inflation.i
%include shortratemodels.i

%{
using QuantLib::Loan;
using QuantLib::UnEqualAmortizationLoan;
using QuantLib::EqualAmortizationLoan;
using QuantLib::EqualCashFlowLoan;
%}

%shared_ptr(Loan)
class Loan : public Bond {
  public:
    Loan(Natural settlementDays,
            const Calendar& calendar,
            Real faceAmount,
            const Date& maturityDate,
            const Date& issueDate = Date(),
            const Leg& cashflows = Leg());
    Loan(Natural settlementDays,
            const Calendar& calendar,
            const Date& issueDate = Date(),
            const Leg& coupons = Leg());
};
%shared_ptr(UnEqualAmortizationLoan)
class UnEqualAmortizationLoan : public Loan {
  public:
		UnEqualAmortizationLoan(Natural settlementDays,
									std::vector<Real> amortizations,
									const Schedule& schedule,
									const Real coupon,
									const DayCounter& dayCounter,
									Compounding comp = Compounded,
									Frequency freq = Annual,
									BusinessDayConvention paymentConvention = Following,
									const Date& issueDate = Date(),
									const Calendar& paymentCalendar = Calendar(),
									const Period& exCouponPeriod = Period(),
									const Calendar& exCouponCalendar = Calendar(),
									const BusinessDayConvention exCouponConvention = Unadjusted,
									bool exCouponEndOfMonth = false);

        UnEqualAmortizationLoan(Natural settlementDays,
                                std::vector<Real> amortizations,
                                const Schedule& schedule,
                                const InterestRate coupon,
                                BusinessDayConvention paymentConvention = Following,
                                const Date& issueDate = Date(),
                                const Calendar& paymentCalendar = Calendar(),
                                const Period& exCouponPeriod = Period(),
                                const Calendar& exCouponCalendar = Calendar(),
                                const BusinessDayConvention exCouponConvention = Unadjusted,
                                bool exCouponEndOfMonth = false);

        UnEqualAmortizationLoan(Natural settlementDays,
                                std::vector<Real> amortizations,
                                Schedule schedule,
                                YieldTermStructure& discountCurve,
                                const DayCounter& dayCounter,
								Compounding comp = Compounded,
								Frequency freq = Annual,
                                BusinessDayConvention paymentConvention = Following,
                                const Date& issueDate = Date(),
                                const Calendar& paymentCalendar = Calendar(),
                                const Period& exCouponPeriod = Period(),
                                const Calendar& exCouponCalendar = Calendar(),
                                const BusinessDayConvention exCouponConvention = Unadjusted,
                                bool exCouponEndOfMonth = false);

        Frequency frequency() const;
        const DayCounter& dayCounter() const;
};

%shared_ptr(EqualAmortizationLoan)
class EqualAmortizationLoan : public Loan {
  public:
		EqualAmortizationLoan(Natural settlementDays,
								  Real faceAmount,
								  const Schedule& schedule,
								  const Real coupon,
								  const DayCounter& dayCounter,
								  Compounding comp = Compounded,
								  Frequency freq = Annual,
								  BusinessDayConvention paymentConvention = Following,
								  const Date& issueDate = Date(),
								  const Calendar& paymentCalendar = Calendar(),
								  const Period& exCouponPeriod = Period(),
								  const Calendar& exCouponCalendar = Calendar(),
								  const BusinessDayConvention exCouponConvention = Unadjusted,
								  bool exCouponEndOfMonth = false);

        EqualAmortizationLoan(Natural settlementDays,
                              Real faceAmount,
                              const Schedule& schedule,
                              const InterestRate coupon,
                              BusinessDayConvention paymentConvention = Following,
                              const Date& issueDate = Date(),
                              const Calendar& paymentCalendar = Calendar(),
                              const Period& exCouponPeriod = Period(),
                              const Calendar& exCouponCalendar = Calendar(),
                              const BusinessDayConvention exCouponConvention = Unadjusted,
                              bool exCouponEndOfMonth = false);

        EqualAmortizationLoan(Natural settlementDays,
                              Real faceAmount,
                              Schedule schedule,
                              YieldTermStructure& discountCurve,
                              const DayCounter& dayCounter,
							  Compounding comp = Compounded,
							  Frequency freq = Annual,
                              BusinessDayConvention paymentConvention = Following,
                              const Date& issueDate = Date(),
                              const Calendar& paymentCalendar = Calendar(),
                              const Period& exCouponPeriod = Period(),
                              const Calendar& exCouponCalendar = Calendar(),
                              const BusinessDayConvention exCouponConvention = Unadjusted,
                              bool exCouponEndOfMonth = false);
	Frequency frequency() const;
    DayCounter dayCounter() const;
};

%shared_ptr(EqualCashFlowLoan)
class EqualCashFlowLoan : public Loan {
  public:
    EqualCashFlowLoan(Natural settlementDays,
                          Real faceAmount,
                          const Schedule& schedule,
                          const Real coupon,
                          const DayCounter& dayCounter,
                          Compounding comp = Compounded,
                          Frequency freq = Annual,
                          BusinessDayConvention paymentConvention = Following,
                          const Date& issueDate = Date(),
                          const Calendar& paymentCalendar = Calendar(),
                          const Period& exCouponPeriod = Period(),
                          const Calendar& exCouponCalendar = Calendar(),
                          const BusinessDayConvention exCouponConvention = Unadjusted,
                          bool exCouponEndOfMonth = false);

        EqualCashFlowLoan(Natural settlementDays,
                          Real faceAmount,
                          const Schedule& schedule,
                          const InterestRate& coupon,
                          BusinessDayConvention paymentConvention = Following,
                          const Date& issueDate = Date(),
                          const Calendar& paymentCalendar = Calendar(),
                          const Period& exCouponPeriod = Period(),
                          const Calendar& exCouponCalendar = Calendar(),
                          const BusinessDayConvention exCouponConvention = Unadjusted,
                          bool exCouponEndOfMonth = false);

        EqualCashFlowLoan(Natural settlementDays,
                          Real faceAmount,
                          const Schedule& schedule,
                          const YieldTermStructure& discountCurve,
                          const DayCounter& accrualDayCounter,
                          Compounding comp = Compounded,
                          Frequency freq = Annual,
                          BusinessDayConvention paymentConvention = Following,
                          const Date& issueDate = Date(),
                          const Calendar& paymentCalendar = Calendar(),
                          const Period& exCouponPeriod = Period(),
                          const Calendar& exCouponCalendar = Calendar(),
                          const BusinessDayConvention exCouponConvention = Unadjusted,
                          bool exCouponEndOfMonth = false);
	Frequency frequency() const;
    DayCounter dayCounter() const;
};

#endif
