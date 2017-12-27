<!--
 - Created by Carlos Bastidas on 21-12-2017.
 -->

<aura:application description="BiceFaseDos" extends="force:slds">

    <div class="slds-grid slds-wrap slds-grid--pull-padded">
            <div class="slds-col--padded slds-size--1-of-1">
                <c:BiceBaseSearch />
            </div>
            <div class="slds-col--padded slds-size--1-of-1">
                <!-- base page component -->
                <c:BiceBasePage />
            </div>
    </div>

    <!-- common components -->
    <c:BiceBaseModal />
    <c:spinner />
</aura:application>