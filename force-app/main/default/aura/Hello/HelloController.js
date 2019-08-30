({
    doInit : function(component, event, helper) {
        var action = component.get("c.getNames");

        action.setCallback(this, function(response) {
            var state = response.getState();

            if (state === "SUCCESS") {
                component.set("v.names", response.getReturnValue());
            }
        });

        $A.enqueueAction(action);
    }
})
